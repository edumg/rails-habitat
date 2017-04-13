class ChangeAnswersToAnswerInPersonalityStorages < ActiveRecord::Migration[5.0]
  def change
    remove_column :personality_storages, :answers, :string
    add_column :personality_storages, :answer, :string
  end
end
