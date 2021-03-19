class CreateMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors do |t|
      t.string :area_of_expertise
      t.string :prefferd_method_of_contact
      t.string :school
      t.string :current_position
      t.string :location
      t.integer :length_of_mentorship

      t.timestamps
    end
  end
end
