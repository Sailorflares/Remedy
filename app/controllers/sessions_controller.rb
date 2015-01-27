class SessionsController < ApplicationController

  def index
    redirect_to home_url(session[:user_id]) if current_user
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to home_url(user.id)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
