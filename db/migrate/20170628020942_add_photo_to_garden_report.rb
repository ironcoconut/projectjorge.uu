class AddPhotoToGardenReport < ActiveRecord::Migration[5.1]
  def change
    add_column :garden_reports, :photo, :string
  end
end
