class CreatePersonalities < ActiveRecord::Migration[5.0]
  def change
    create_table :personalities do |t|
      t.references :question, foreign_key: true
      t.references :profile, foreign_key: true
      t.text :answers, :default => [].to_yaml

      t.timestamps
    end
  end
end
