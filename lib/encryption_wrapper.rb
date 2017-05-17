class EncryptionWrapper

  attr_reader :attribute, :record

  def initialize(attribute)
    @attribute = attribute
    @record = nil
  end

  def before_save(record)
     @record = record
     encrypt
  end

  def after_save(record)
    @record = record
    decrypt
  end

  alias_method :after_find, :after_save

  private
  
  def encrypt
    key = generate_key
    record.send("#{attribute}=", cipher_value(key))
  end

  def decrypt
    key = generate_key
    record.send("#{attribute}=", decipher_value(key))
  end

  def generate_key
    digest = Digest::SHA256.new
    digest.update(ENV['encryption_secret'])
    digest.digest
  end

  def cipher_value(key)
    cipher = OpenSSL::Cipher::AES.new(256, :CBC)
    cipher.encrypt
    cipher.key = key
    record.iv = cipher.random_iv
    cipher.update(record.send(attribute)) + cipher.final
  end

  def decipher_value(key)
    decipher = OpenSSL::Cipher::AES.new(256, :CBC)
    decipher.decrypt
    decipher.key = key
    decipher.iv = record.iv
    decipher.update(record.send(attribute)) + decipher.final
  end
end
