class GardenReport < ApplicationRecord
  belongs_to :garden
  mount_uploader :photo, ReportPhotoUploader

  validates :notes, presence: true
end