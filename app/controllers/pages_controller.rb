class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: :homepage

  def homepage

  end

  def dashboard
    @bookings = current_user.bookings
    @my_tools = current_user.my_tools
    @user = current_user
  end
end
