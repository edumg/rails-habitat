class AddReferencesTopersonalitystorages < ActiveRecord::Migration[5.0]
  def change
    remove_column :personalitystorages, :answer_id, :integer
    add_reference :personalitystorages, :answer, index: true
  end
end
