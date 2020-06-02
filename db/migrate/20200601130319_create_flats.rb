class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :type
      t.integer :number_of_rooms
      t.integer :price_per_month
      t.integer :separation_allowed

      t.timestamps
    end
  end
end
