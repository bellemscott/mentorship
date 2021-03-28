class DeleteLengthFromMentees < ActiveRecord::Migration[6.1]
  def change
    remove_column :mentees, :length_of_mentorship
  end
end
