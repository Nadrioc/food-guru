class Lesson < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bookings
  validates :cuisine, presence: true
  validates :location, presence: true
  validates :title, presence: true
end
