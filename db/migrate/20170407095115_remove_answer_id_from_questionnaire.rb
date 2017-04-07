class RemoveAnswerIdFromQuestionnaire < ActiveRecord::Migration[5.0]
  def change
    remove_reference :questionnaires, :answer, index: true
  end
end
