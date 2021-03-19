class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :mentor
      t.references :mentee

      t.timestamps
    end
  end
end
