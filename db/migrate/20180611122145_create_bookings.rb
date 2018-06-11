class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :status
      t.integer :attending

      t.timestamps
    end
  end
end
