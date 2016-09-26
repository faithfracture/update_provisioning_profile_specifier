# update_provisioning_profile_specifier plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-update_provisioning_profile_specifier)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-update_provisioning_profile_specifier`, add it to your project by running:

```bash
fastlane add_plugin update_provisioning_profile_specifier
```

## About update_provisioning_profile_specifier

Update the provisioning profile in the Xcode Project file for a specified target

Xcode 8 added a PROVISIONING_PROFILE_SPECIFIER build setting that is (apparently) required at build-time (even with Automatic Codesigning disabled). I have several branded versions of the apps that I work on and most of the changes are scripted to be done during the build phase (change the app ID, provisioning profile, team, etc.). With previous versions of Xcode, I was able to sign the apps with whatever provisioning profile I wanted, but with Xcode 8 that doesn't work anymore. This plugin allows you to change the PROVISIONING_PROFILE_SPECIFIER in your Xcode project so that you can continue to script changes to be made a build time and use whatever provisioning profile you like without having to maintain separate targets with separate provisioning profile specifiers.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`. 

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use 
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate building and releasing your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
