class IpAddress < ApplicationRecord
  enum address_type: {external: 0, internal: 1}
  belongs_to :server
end
