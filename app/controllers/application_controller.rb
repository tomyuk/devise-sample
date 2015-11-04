class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def authenticate_any!
    unless user_signed_in? || admin_signed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to root_url
    end
  end

end
