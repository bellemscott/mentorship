class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :mentors, :prefferd_method_of_contact, :preffered_method_of_contact
  end
end
