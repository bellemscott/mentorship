class AddAcceptedToMatchesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :accepted, :boolean, default: false
  end
end
