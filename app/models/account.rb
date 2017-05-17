class Account < ApplicationRecord
  belongs_to :server

  before_save EncryptionWrapper.new('password')
  after_save EncryptionWrapper.new('password')
  after_find EncryptionWrapper.new('password')


end
