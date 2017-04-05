class AddMinimumStayToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :minimum_stay, :integer
  end
end
