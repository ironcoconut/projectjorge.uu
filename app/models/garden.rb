class Garden < ApplicationRecord
  has_many :reports, class_name: "GardenReport", foreign_key: "garden_id"

  scope :ordered_with_reports_desc, -> { order(:name).includes(:reports).order('garden_reports.created_at desc') }
end
