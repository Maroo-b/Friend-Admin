class Account < ApplicationRecord
  belongs_to :server

  before_save :encrypt_password
  after_save :decrypt_password
  after_find :decrypt_password

  def encrypt_password
    digest = Digest::SHA256.new
    digest.update(ENV['encryption_secret'])
    key = digest.digest

    #Prepare Cipher
    cipher = OpenSSL::Cipher::AES.new(256, :CBC)
    cipher.encrypt
    cipher.key = key
    self.iv = cipher.random_iv

    #encrypt account password
    encrypted_password = cipher.update(self.password) + cipher.final
    self.password = encrypted_password
  end

  def decrypt_password
    digest = Digest::SHA256.new
    digest.update(ENV['encryption_secret'])
    key = digest.digest

    #Prepare Cipher
    decipher = OpenSSL::Cipher::AES.new(256, :CBC)
    decipher.decrypt
    decipher.key = key
    decipher.iv = self.iv

    self.password = decipher.update(self.password) + decipher.final
    
  end

end
