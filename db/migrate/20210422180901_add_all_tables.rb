class AddAllTables < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.string :password_digest
      t.boolean :mentor
      t.boolean :mentee
      t.string :remember_digest
      t.timestamps
    end

    create_table :mentors do |t|
      t.string :area_of_expertise
      t.string :preferred_method_of_contact
      t.string :school
      t.string :current_position
      t.string :location
      t.integer :length_of_mentorship
      t.integer :user_id
      t.timestamps
    end

    create_table :mentees do |t|
      t.string :major
      t.string :area_of_interest
      t.string :preferred_method_of_contact
      t.string :location
      t.integer :length_of_mentorship
      t.string :graduation_year
      t.integer :user_id
      t.timestamps
    end

    create_table :matches do |t|
      t.references :mentor
      t.references :mentee
      t.integer :user_id
      t.boolean :accepted, default: false
      t.boolean :rejected, default: false
      t.timestamps
    end
  end 
end