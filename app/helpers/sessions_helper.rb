module SessionsHelper

  def login_user
    session[:session_token] = @user.reset_session_token!
    redirect_to user_url(@user)
  end
end
