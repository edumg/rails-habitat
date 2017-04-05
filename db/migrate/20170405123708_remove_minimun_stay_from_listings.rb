class RemoveMinimunStayFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :minimun_stay, :integer
  end
end
