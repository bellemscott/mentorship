class AddUserIdToMentors < ActiveRecord::Migration[6.1]
  def change
    add_column :mentors, :user_id, :integer
  end
end
