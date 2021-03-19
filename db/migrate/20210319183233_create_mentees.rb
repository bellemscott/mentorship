class CreateMentees < ActiveRecord::Migration[6.1]
  def change
    create_table :mentees do |t|
      t.string :major
      t.string :area_of_interest
      t.string :preffered_method_of_contact
      t.string :location
      t.string :length_of_mentorship
      t.string :graduation_year

      t.timestamps
    end
  end
end
