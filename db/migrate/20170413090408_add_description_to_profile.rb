class AddDescriptionToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :description, :string
  end
end
