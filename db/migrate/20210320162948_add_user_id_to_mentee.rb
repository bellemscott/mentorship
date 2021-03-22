class AddUserIdToMentee < ActiveRecord::Migration[6.1]
  def change
    add_column :mentees, :user_id, :integer
  end
end
