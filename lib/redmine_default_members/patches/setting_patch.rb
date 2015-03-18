require_dependency 'setting'

module RedmineDefaultMembers
  module Patches
    module SettingPatch

      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          before_save  :save_default_members_values
        end
      end

      module InstanceMethods

        private

        def save_default_members_values
          # Only validate settings for our plugin
          if self.name == 'plugin_redmine_default_members'
            valuehash = self.value
            valuehash.each do |key, default_member|
              valuehash[key][:roles] = valuehash[key][:roles].select{ |r| !r.empty? }
            end
            self.value = valuehash
            Setting.check_cache
            self.value
          end
        end

      end

    end
  end
end

unless Setting.included_modules.include?(RedmineDefaultMembers::Patches::SettingPatch)
  Setting.send(:include, RedmineDefaultMembers::Patches::SettingPatch)
end
