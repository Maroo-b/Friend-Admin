class ServersController < ApplicationController

  before_action :authorize

  def index
    @servers = Server.all
  end

  def new
    @server_form = ServerForm.new()
  end

  def create
    @server_form =ServerForm.new
    @server_form.build_object(server_form_params)

    if @server_form.save
      flash[:success] = "Server details created successfully"
      redirect_to servers_path
    else
      render :new
    end
  end

  def edit
    server = Server.find(params[:id])
    @server_form = ServerForm.new(server: server, accounts_data: server.accounts, ip_addresses_data: server.ip_addresses)
  end

  def update
    server = Server.find(params[:id])
    @server_form = ServerForm.new(server: server, accounts_data: server.accounts, ip_addresses_data: server.ip_addresses)
    @server_form.build_object(server_form_params)
    if @server_form.save
      flash[:success] = "Server details created successfully"
      redirect_to servers_path
    else
      render :new
    end
  end

  private

  def server_form_params
    params.permit(
      server: [:name, :cpu, :drive, :ram, :os, :os_type, :applications],
      ip_addresses_data: [:ip, :network_mask, :network_address, :gateway, :address_type],
      accounts_data: [:user, :password, :account_type]
    )
  end
  
end
