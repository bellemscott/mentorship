class AddRejectedToMatchesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :rejected, :boolean
  end
end
