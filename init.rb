# coding: utf-8

require 'redmine'

require 'redmine_default_members'

Redmine::Plugin.register :redmine_default_members do
  name 'Redmine Default Members'
  author 'Nicolas Rodriguez'
  description 'This is a plugin for Redmine to add default project members'
  version '1.0-devel'
  url 'http://www.jbox-web.com'
  author_url 'mailto:nrodriguez@jbox-web.com'

  settings({
    :partial => 'settings/redmine_default_members_settings',
    :template => {
      :group => 'Superviseur',
      :roles => []
    }
  })
end
