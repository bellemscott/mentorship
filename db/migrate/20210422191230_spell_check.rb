class SpellCheck < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :filename, :firstname
  end
end
