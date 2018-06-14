class BookingsController < ApplicationController
  before_action :set_lesson
  def new
    @booking = Booking.new
  end

  def create
    @lesson.user = @chef
    @student = current_user
    @booking = Booking.new
    @booking.status = "Pending"
    redirect_to lesson_path(@lesson)
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
