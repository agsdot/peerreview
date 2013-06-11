class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def redirect_to_root
    flash[:notice] = "You need to sign in."
    redirect_to root_path
  end

  def signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end