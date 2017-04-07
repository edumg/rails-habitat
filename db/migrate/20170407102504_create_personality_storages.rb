class CreatePersonalityStorages < ActiveRecord::Migration[5.0]
  def change
    create_table :personality_storages do |t|
      t.references :question
      t.text :answers, :default => [].to_yaml
      t.string :session

      t.timestamps
    end
  end
end
