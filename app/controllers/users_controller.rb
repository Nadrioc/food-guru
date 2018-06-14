class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @listed_lessons = @user.listed_lessons
    @bookings = Booking.where(user: @user)
  end
end
