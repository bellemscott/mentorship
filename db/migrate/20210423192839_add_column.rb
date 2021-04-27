class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :matching_preferences, :user_id, :integer
  end
end
