class AuthController < ApplicationController
  before_filter :check_logged_in

  private
  def check_logged_in
    user = User.find(session[:user_id]) if session[:user_id]
    unless user
      reset_session
      redirect_to log_in_url, :notice => "Unauthorized"
    end
  end
end