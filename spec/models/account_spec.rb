require 'rails_helper'

RSpec.describe Account, type: :model do
  describe '#encrypt_password' do
    it 'encrypt password before saving to DB' do
      server = create(:server)
      account = build(:account, password: '1234567', server_id: server.id)
      account.save
    
      expect(account.password).not_to eq('1234567')
    end
  end

  describe '#decrypt_password' do
    it '#decrypted password' do
      server = create(:server)
      account = build(:account, password: '1234567', server_id: server.id)
      account.save

      expect(server.accounts.first.password).to eq('1234567')
    end
  end
end
