class AddSkuToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :sku, :string

  end
end
