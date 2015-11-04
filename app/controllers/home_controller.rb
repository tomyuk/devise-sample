class HomeController < ApplicationController
  before_action :authenticate_any!, only: :show

  def index
    if user_signed_in?
      redirect_to '/users'
    elsif admin_signed_in?
      redirect_to '/admins'
    end
  end

  def show
  end
end
