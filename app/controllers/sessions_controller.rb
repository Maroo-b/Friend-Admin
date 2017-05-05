class SessionsController < ApplicationController
  layout false

  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      login_user(user)
    else
      flash.now[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
    
  end

  private

  def login_user(user)
    session[:user_id] = user.id
    flash[:notice] = "Welcome, you are now logged in"
    redirect_to servers_path
  end
  
end
