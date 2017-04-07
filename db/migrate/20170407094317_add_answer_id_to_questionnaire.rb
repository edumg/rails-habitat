class AddAnswerIdToQuestionnaire < ActiveRecord::Migration[5.0]
  def change
      add_reference :questionnaires, :answer, index: true
  end
end
