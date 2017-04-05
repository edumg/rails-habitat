class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :profile, foreign_key: true
      t.string :name
      t.string :location
      t.string :type_place
      t.string :description
      t.string :photos
      t.string :amenities
      t.float :price
      t.string :rules
      t.integer :num_rooms
      t.boolean :registration

      t.timestamps
    end
  end
end
