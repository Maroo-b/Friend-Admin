class Server < ApplicationRecord
  has_many :ip_addresses
  has_many :accounts
end
