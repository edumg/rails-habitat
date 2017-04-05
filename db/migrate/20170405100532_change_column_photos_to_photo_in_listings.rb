class ChangeColumnPhotosToPhotoInListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :photos, :string
    add_column :listings, :photo, :string
  end
end
