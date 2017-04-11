class RemoveRegistrationFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :registration, :boolean
  end
end
