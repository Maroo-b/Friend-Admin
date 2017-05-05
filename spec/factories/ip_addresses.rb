FactoryGirl.define do
  factory :ip_address do
    ip "152.12.13.22"
    network_address "152.12.0.0"
    network_mask "255.255.0.0" 
    gateway "152.12.13.5"
    address_type "internal"
  end
end
