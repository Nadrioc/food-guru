class BookingsController < ApplicationController
  before_action :set_lesson, only: [:new, :create]
  def new
    @booking = Booking.new
  end

  def create
    @lesson.user = @chef
    @student = current_user
    @booking = Booking.new(user: @student, lesson: @lesson)
    @booking.status = "Pending"
    @booking.save
    redirect_to lesson_path(@lesson)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(permitted_params)
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def permitted_params
    params.require(:booking).permit(:status)
  end

end



