class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :profile, foreign_key: true
      t.references :listing, foreign_key: true
      t.string :status
      t.date :start_date
      t.date :end_date
      t.integer :num_guests
      t.float :rent_cost

      t.timestamps
    end
  end
end
