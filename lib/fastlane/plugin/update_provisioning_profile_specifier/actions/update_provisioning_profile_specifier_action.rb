module Fastlane
  module Actions
    class UpdateProvisioningProfileSpecifierAction < Action
      def self.run(params)
        require 'xcodeproj'

        specifier_key = 'PROVISIONING_PROFILE_SPECIFIER'

        # assign folder from the parameter or search for an .xcodeproj file
        pdir = params[:xcodeproj] || Dir["*.xcodeproj"].first

        # validate folder
        project_file_path = File.join(pdir, "project.pbxproj")
        UI.user_error!("Could not find path to project config '#{project_file_path}'. Pass the path to your project (NOT workspace!)") unless File.exists?(project_file_path)
        target = params[:target]

        project = Xcodeproj::Project.open(pdir)
        project.targets.each do |t|
          if !target || t.name.match(target)
            UI.success("Updating target #{t.name}")
          else
            UI.important("Skipping target #{t.name} as it doesn't match the filter '#{target}'")
            next
          end

          t.build_configuration_list.build_configurations.each do |config|
            if (params[:append])
              cur = config.build_settings[specifier_key]
              config.build_settings[specifier_key] = cur + params[:new_specifier]
            else
              config.build_settings[specifier_key] = params[:new_specifier]
            end
          end
        end
        project.save

        UI.success("Successfully updated project settings in '#{params[:xcodeproj]}'")
      end

      def self.description
        "Update the provisioning profile in the Xcode Project file for a specified target"
      end

      def self.authors
        ["Jordan Bondo"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
                     key: :xcodeproj,
                env_name: "UPDATE_PROVISIONING_PROFILE_SPECIFIER_XCODEPROJ",
             description: "Path to the .xcodeproj file",
                optional: true,
            verify_block: proc do |value|
                            UI.user_error!("Path to Xcode project file is invalid") unless File.exist?(value)
                          end),
          FastlaneCore::ConfigItem.new(
                    key: :target,
               env_name: "UPDATE_PROVISIONING_PROFILE_SPECIFIER_TARGET", 
            description: "The target for which to change the Provisioning Profile Specifier. If unspecified the change will be applied to all targets",
               optional: true),
          FastlaneCore::ConfigItem.new(
                    key: :new_specifier,
               env_name: "UPDATE_PROVISIONING_PROFILE_SPECIFIER_NEW_SPECIFIER",
            description: "Name of the new provisioning profile specifier to use, or to append to the existing value",
               optional: false),
          FastlaneCore::ConfigItem.new(
                    key: :append,
               env_name: "UPDATE_PROVISIONING_PROFILE_SPECIFIER_APPEND",
            description: ["True to append 'new_specifier' to the end of the exxisting specifier.",
                         "This works well if you have provisioning profiles for the same project with different configurations, ",
                         "'MyApp' and 'MyAppBeta', for example"].join('\n'),
               optional: true,
          default_value: false,
              is_string: false)
        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end
    end
  end
end
