module RedmineDefaultMembers
  module ExtraLoading

    # HAML gem
    Haml::Template.options[:attr_wrapper] = '"'

  end
end
