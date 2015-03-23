require_dependency 'projects_controller'

module RedmineDefaultMembers
  module Patches
    module ProjectsControllerPatch

      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          alias_method_chain :create, :default_members
        end
      end

      module InstanceMethods

        def create_with_default_members(&block)
          # Do actual creation
          create_without_default_members(&block)

          # Only create membership if project creation worked
          create_default_members if valid_project?
        end


        private


          def valid_project?
            if Rails::VERSION::MAJOR == 3
              validate_parent_id && @project.save
            else
              @project.save
            end
          end


          def create_default_members
            Setting.plugin_redmine_default_members.each do |key, default_members|
              next if key == 'template'
              next if default_members[:roles].empty?
              group = Group.find_by_lastname(default_members[:group])
              users = User.active.in_group(group).all
              users.each do |user|
                next if user.anonymous?
                roles = Role.where(id: default_members[:roles])
                Member.create(user: user, role_ids: roles.map(&:id), project: @project)
                check_roles_for_user!(user, roles)
              end
            end
          end


          # Workaround for what seems to be a Redmine bug.
          #
          def check_roles_for_user!(user, roles)
            roles.each do |role|
              if !user.roles_for_project(@project).include?(role)
                membership = @project.member_principals.select { |m| m.user == user }.first
                membership.role_ids = roles.map(&:id)
                membership.save!
              end
            end
          end

      end

    end
  end
end

unless ProjectsController.included_modules.include?(RedmineDefaultMembers::Patches::ProjectsControllerPatch)
  ProjectsController.send(:include, RedmineDefaultMembers::Patches::ProjectsControllerPatch)
end
