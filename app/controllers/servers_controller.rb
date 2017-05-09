class ServersController < ApplicationController

  def index
    
  end

  def new
    @server_form = ServerForm.new
  end

  def create
    
  end

  private

  def server_form_params
    params.require(:server).permit(:name, :cpu, :drive, :ram, :os, :os_type, :applications, ip_addresses: [:ip, :network_mask, :network_address, :gateway, :address_type], accounts: [:user, :password, :account_type])
  end
  
end
