class CreatePersonalitystorages < ActiveRecord::Migration[5.0]
  def change
    create_table :personalitystorages do |t|
      t.references :answer
      t.references :question
      t.string :session

      t.timestamps
    end
  end
end
