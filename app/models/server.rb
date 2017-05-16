class Server < ApplicationRecord
  paginates_per 10
  has_many :ip_addresses
  has_many :internal_ip_addresses, -> { where(address_type: :internal) }, class_name: "IpAddress"
  has_many :external_ip_addresses, -> { where(address_type: :external) }, class_name: "IpAddress"
  has_many :accounts
  
end
