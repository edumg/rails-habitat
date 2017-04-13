class RemoveListingIdFromPhoto < ActiveRecord::Migration[5.0]
  def change
    remove_reference :photos, :listing, index: true
  end
end
