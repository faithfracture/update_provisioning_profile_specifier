# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/update_provisioning_profile_specifier/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-update_provisioning_profile_specifier'
  spec.version       = Fastlane::UpdateProvisioningProfileSpecifier::VERSION
  spec.author        = %q{Jordan Bondo}
  spec.email         = %q{jordan.bondo@gmail.com}

  spec.summary       = %q{Update the provisioning profile in the Xcode Project file for a specified target}
  spec.homepage      = "https://github.com/faithfracture/update_provisioning_profile_specifier"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'xcodeproj', '>= 1.3.3'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.103.0'
end
