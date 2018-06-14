class DashboardController < ApplicationController
  def show
    @user = current_user
    @listed_lessons = @user.listed_lessons
    @bookings = Booking.where(user: @user)
  end
end
