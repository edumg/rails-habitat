class CreateQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires do |t|
      t.references :listing
      t.references :question

      t.timestamps
    end
  end
end
