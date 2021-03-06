class User < ApplicationRecord
  has_many :listed_lessons, class_name: "Lesson"
  has_many :bookings
  has_many :lessons, through: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
