class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @selected_lessons = Lesson.limit(9)
    @lessons = Lesson.limit(3)
    @first_lesson = @lessons.sample
  end
end
