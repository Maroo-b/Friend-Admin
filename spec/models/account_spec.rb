require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Account callbacks' do
    it 'trigger a callback for EncryptionWrapper' do
      server = create(:server)
      account = build(:account, password: '1234567', server_id: server.id)
      expect_any_instance_of(EncryptionWrapper).to receive(:before_save)
      expect_any_instance_of(EncryptionWrapper).to receive(:after_save)
      account.save
    end
  end

end
