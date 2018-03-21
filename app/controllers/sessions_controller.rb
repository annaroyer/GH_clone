class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.update_or_create(auth)
    redirect_to user_path(user)
    session[:user_id] = user.uid
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
