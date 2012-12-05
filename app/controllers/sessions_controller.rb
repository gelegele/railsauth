class SessionsController < ApplicationController

  def new
    if session[:user_id] && User.find(session[:user_id])
      redirect_to users_url
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_url, :notice => "Logged in!"
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Loged out!"
  end
end
