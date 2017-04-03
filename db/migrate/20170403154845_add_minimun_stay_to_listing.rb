class AddMinimunStayToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :minimun_stay, :integer
  end
end
