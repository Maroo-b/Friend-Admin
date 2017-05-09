class ServerForm
  include ActiveModel::Model
  
  attr_accessor :server, :accounts, :ip_addresses

  def server
    @server ||= Server.new
  end

  def ip_addresses
    @ip_addresses ||= []
  end

  def accounts
    @accounts ||= []
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


  def assign_attributes(params)
    accounts_attributes = []
    server_attributes = params.slice(*self.class.server_attributes)
    server.assign_attributes(server_attributes)
    unless params.blank?
      params[:ip_addresses].each do |ip_address_params|
        ip_address_attributes = params.slice(*self.class.ip_address_attributes)
        ip_addresses << IpAddress.new(ip_address_attributes)
      end
      params[:accounts].each do |account|
        account_attributes = params.slice(*self.class.account_attributes)
        accounts << Account.new(account_attributes)
      end
    end

    setup_association
  end

  def save
    if valid?
      ActiveRecord::Base.transaction do
        server.save!
        ip_addresses.each(&:save!)
        accounts.each(&:save!)
      end
    end
  end

  private

  def setup_association
    server.accounts << accounts 
    server.ip_addresses << ip_addresses
  end
end
