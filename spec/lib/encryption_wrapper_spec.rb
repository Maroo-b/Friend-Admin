require 'rails_helper'

class Dummy
  attr_accessor :password, :iv
  def initialize(password, iv=nil)
    @password = password 
    @iv = iv
  end
end

RSpec.describe EncryptionWrapper do
  describe '#before_save' do
    it 'encrypt the specified attribute' do
      new_record = Dummy.new('1234')
      EncryptionWrapper.new('password').before_save(new_record)

      expect(new_record.password).not_to eq('1234')
    end

    it 'set IV attribute value' do
      new_record = Dummy.new('1234')
      EncryptionWrapper.new('password').before_save(new_record)

      expect(new_record.iv).not_to be_nil
    end
  end

  describe '#after_save' do
    it 'decrypt the specified field' do
      new_record = Dummy.new('1234')
      EncryptionWrapper.new('password').before_save(new_record)
      EncryptionWrapper.new('password').after_save(new_record)

      expect(new_record.password).to eq('1234')
    end
  end
end
