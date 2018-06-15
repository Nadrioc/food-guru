class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        lessons.title ILIKE :query \
        OR lessons.description ILIKE :query \
        OR lessons.cuisine ILIKE :query \
        OR lessons.location ILIKE :query \
      "
      @lessons = Lesson.where(sql_query, query: "%#{params[:query]}%")
    else
      @lessons = Lesson.all
    end

    @markers = @lessons.where.not(latitude: nil, longitude: nil).map do |lesson|
      {
        lat: lesson.latitude,
        lng: lesson.longitude,
        infoWindow: { content: render_to_string(partial: "/lessons/map_box", locals: { lesson: lesson }) }
      }
    end
  end

  def show
    @lesson = Lesson.find(params[:id])


    @markers = [
      {
        lat: @lesson.latitude,
        lng: @lesson.longitude
        # infoWindow: { content: render_to_string(partial: "/map_box_show", locals: { lesson: lesson }) }
      }
    ]
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

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    redirect_to lesson_path(@lesson)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:cuisine, :location, :title, :description, :image, :body, :capacity, :price, :starts_at)
  end
end
