class Server < ApplicationRecord
  paginates_per 2
  has_many :ip_addresses
  has_many :accounts
end
