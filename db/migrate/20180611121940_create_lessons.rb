class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :cuisine
      t.string :location
      t.string :title
      t.text :description
      t.string :image
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
