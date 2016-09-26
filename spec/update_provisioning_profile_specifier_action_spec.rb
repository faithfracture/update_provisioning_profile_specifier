describe Fastlane::Actions::UpdateProvisioningProfileSpecifierAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The update_provisioning_profile_specifier plugin is working!")

      Fastlane::Actions::UpdateProvisioningProfileSpecifierAction.run(nil)
    end
  end
end
