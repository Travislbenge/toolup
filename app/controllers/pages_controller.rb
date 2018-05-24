class PagesController < ApplicationController

  def homepage

  end

  def dashboard
    @bookings = current_user.bookings
    @my_tools = current_user.my_tools
    @user = current_user
  end
end
