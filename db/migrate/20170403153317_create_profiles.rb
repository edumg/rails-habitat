class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.boolean :is_host
      t.date :birth_date
      t.string :gender
      t.references :user

      t.timestamps
    end
  end
end
