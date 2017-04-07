class RemoveAnswerFromQuestionnaire < ActiveRecord::Migration[5.0]
  def change
    remove_column :questionnaires, :answer, :boolean
    add_column :questionnaires, :answers, :string
  end
end
