class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
