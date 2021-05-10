class Adddms < ActiveRecord::Migration[6.1]
  def change
    add_column :chatrooms, :direct_message, :boolean, default: false 
  end
end
