class AddIdAltToQuestion < ActiveRecord::Migration[5.0]
  def change
      add_column :questions, :id_alt, :integer
  end
end
