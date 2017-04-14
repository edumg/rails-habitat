class AddRentCostCentToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :rent_cost_cents, :integer
  end
end
