class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.verify_password(params[:password])
      login_user
    else
      flash[:error] = "You didn't log in right."
      render :new
    end


  end

  def destroy
    @user = current_user

    if @user.nil?
      redirect_to new_session_url
      return
    end

    @user.reset_session_token!

    session[:session_token] = nil

    redirect_to new_session_url
  end
end
