class CreateParentsResources < ActiveRecord::Migration[5.1]
  def change
    create_table :parents_resources do |t|
      t.string :title
      t.string :link
      t.text :notes
      t.string :age_min
      t.string :age_max
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end
