class CreateMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :profession

      t.timestamps
    end
  end
end
