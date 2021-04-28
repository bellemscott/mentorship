class ChangeBoolean < ActiveRecord::Migration[6.1]
  def change
    change_column_default :matching_preferences, :location, true
    change_column_default :matching_preferences, :length_of_mentorship, true
    change_column_default :matching_preferences, :common_subjects, true
    change_column_default :matching_preferences, :brandeis_alumni, false
  end
end
