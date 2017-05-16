require 'rails_helper'

RSpec.describe Server, type: :model do
  describe '#internal_ip_addresses' do
    it 'returns internal IP addresses' do
      server = Server.create(name: 'new server')
      internal_ip =  IpAddress.create(ip: '122.122.122.122', address_type: :internal, server_id: server.id)
      external_ip =  IpAddress.create(ip: '122.122.122.122', address_type: :external, server_id: server.id)

      expect(server.internal_ip_addresses).to include(internal_ip)
      expect(server.internal_ip_addresses).not_to include(external_ip)
    end
  end

  describe '#external_ip_addresses' do
    it 'returns external IP addresses' do
      server = Server.create(name: 'new server')
      internal_ip =  IpAddress.create(ip: '122.122.122.122', address_type: :internal, server_id: server.id)
      external_ip =  IpAddress.create(ip: '122.122.122.122', address_type: :external, server_id: server.id)

      expect(server.external_ip_addresses).to include(external_ip)
      expect(server.external_ip_addresses).not_to include(internal_ip)
    end
  end
end
