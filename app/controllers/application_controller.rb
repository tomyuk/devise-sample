class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def logged_in!
    unless user_logged_in? || admin_loged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to root_url
    end

end
