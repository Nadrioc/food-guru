class Lesson < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :cuisine, presence: true
  validates :location, presence: true
  validates :title, presence: true
end
