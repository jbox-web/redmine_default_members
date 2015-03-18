## Set up autoload of patches
Rails.configuration.to_prepare do

  ## Redmine Default Members Libs, Patches and Hooks
  rbfiles = Rails.root.join('plugins', 'redmine_default_members', 'lib', 'redmine_default_members', '**', '*.rb')
  Dir.glob(rbfiles).each do |file|
    # Exclude Redmine Views Hooks from Rails loader to avoid multiple calls to hooks on reload in dev environment.
    require_dependency file unless File.dirname(file) == Rails.root.join('plugins', 'redmine_default_members', 'lib', 'redmine_default_members', 'hooks').to_s
  end

end
