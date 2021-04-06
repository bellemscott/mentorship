class CreateMatchingPreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :matching_preferences do |t|
      t.boolean :location
      t.boolean :length_of_mentorship
      t.boolean :common_subjects
      t.boolean :brandeis_alumni

      t.timestamps
    end
  end
end
