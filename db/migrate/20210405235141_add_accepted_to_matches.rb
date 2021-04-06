class AddAcceptedToMatches < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :accepted , :boolean
  end
end
