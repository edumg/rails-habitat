class RemovePersonalityStorageTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :personality_storages
  end
end
