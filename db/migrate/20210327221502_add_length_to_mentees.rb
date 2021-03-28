class AddLengthToMentees < ActiveRecord::Migration[6.1]
  def change
    add_column :mentees, :length_of_mentorship , :integer
  end
end
