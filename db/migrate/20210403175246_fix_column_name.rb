class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :mentors, :preffered_method_of_contact, :preferred_method_of_contact
    rename_column :mentees, :preffered_method_of_contact, :preferred_method_of_contact
  end
end
