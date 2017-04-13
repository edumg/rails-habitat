class ChangeAnswersFromPersonalityStorages < ActiveRecord::Migration[5.0]
  def change
    remove_column :personality_storages, :answers, :default => [].to_yaml
    add_column :personality_storages, :answers, :string
  end
end
