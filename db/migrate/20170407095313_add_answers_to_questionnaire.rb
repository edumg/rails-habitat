class AddAnswersToQuestionnaire < ActiveRecord::Migration[5.0]
  def change
    add_column :questionnaires, :answer, :boolean, array: true, default: []
  end
end
