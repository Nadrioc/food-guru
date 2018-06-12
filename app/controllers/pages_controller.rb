class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @lessons = Lesson.limit(10)
  end
end
