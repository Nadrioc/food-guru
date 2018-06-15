class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @listed_lessons = @user.listed_lessons.first(3)
    @bookings = Booking.where(user: @user)
  end

  # private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :description, :image,)
  # end
end


