class DeleteAcceptedFromMatches < ActiveRecord::Migration[6.1]
  def change
    remove_column :matches, :accepted
  end
end
