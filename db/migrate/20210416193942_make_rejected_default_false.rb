class MakeRejectedDefaultFalse < ActiveRecord::Migration[6.1]
  def change
    change_column :matches, :rejected, :boolean, :default => false
  end
end
