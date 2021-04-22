class DropTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :mentors
    drop_table :mentees
    drop_table :matches
    drop_table :users
  end
end
