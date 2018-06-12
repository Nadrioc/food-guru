class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @user = current_user
    @lesson = Lesson.new(lesson_params)
    @lesson.user = @user
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:cuisine, :location, :title, :description, :image, :capacity)
  end
end
