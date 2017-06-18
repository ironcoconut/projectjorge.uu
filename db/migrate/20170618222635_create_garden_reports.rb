class CreateGardenReports < ActiveRecord::Migration[5.1]
  def change
    create_table :garden_reports do |t|
      t.text :notes
      t.references :garden, foreign_key: true

      t.timestamps
    end
  end
end
