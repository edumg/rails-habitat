class RemoveRentCostCentsCentsAndSkuFromBooking < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :rent_cost_cents_cents, :integer
    remove_column :bookings, :sku, :string
  end
end
