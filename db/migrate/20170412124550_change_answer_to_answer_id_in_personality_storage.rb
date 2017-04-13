class ChangeAnswerToAnswerIdInPersonalityStorage < ActiveRecord::Migration[5.0]
  def change
    remove_column :personality_storages, :answer, :string
    add_reference :personality_storages, :answer, index: true
   end
end
