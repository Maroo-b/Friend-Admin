class ServerForm
  include ActiveModel::Model
  
  attr_accessor :server, :accounts_data, :ip_addresses_data

  def server
    @server ||= Server.new
  end

  def ip_addresses_data
    @ip_addresses_data ||= []
  end

  def accounts_data
    @accounts_data ||= []
  end

  def self.server_attributes
    Server.column_names.push(Server.reflections.keys).flatten
  end

  def self.ip_address_attributes
    IpAddress.column_names.push(IpAddress.reflections.keys).flatten
  end

  def self.account_attributes
    Account.column_names.push(Account.reflections.keys).flatten
  end

  server_attributes.each do |attr|
    delegate attr.to_sym, "#{attr}=".to_sym, to: :server
  end

  delegate :id, :persisted?, to: :server

  def self.model_name
    new.server.model_name
  end


  def build_object(params)
    if server.persisted?
      destroy_associated_records
    end
    server_attributes = params[:server].slice(*self.class.server_attributes)
    server.assign_attributes(server_attributes)
    build_ip_addresses(params[:ip_addresses_data])
    build_accounts(params[:accounts_data])

    setup_association
  end

  def save
    if valid?
      server.save!
    end
  end

  private

  def setup_association
    server.accounts << accounts_data
    server.ip_addresses << ip_addresses_data
  end

  def destroy_associated_records
    server.ip_addresses.destroy_all
    server.accounts.destroy_all
  end

  def build_ip_addresses(ip_addresses_params)
    ip_addresses_params.each do |ip_address_params|
      ip_address_attributes = ip_address_params.slice(*self.class.ip_address_attributes)
      ip_addresses_data << IpAddress.new(ip_address_attributes)
    end
  end

  def build_accounts(accounts_params)
    accounts_params.each do |account_params|
      account_attributes = account_params.slice(*self.class.account_attributes)
      accounts_data << Account.new(account_attributes)
    end
  end
end
