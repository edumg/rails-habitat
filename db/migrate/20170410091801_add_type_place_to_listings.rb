class AddTypePlaceToListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :type, :string
    add_column :listings, :type_place, :string
  end
end
