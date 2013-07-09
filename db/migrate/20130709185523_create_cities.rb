class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :country_id, null: false
      t.timestamps
    end
    
    add_index :cities, :name
    add_index :cities, :country_id
  end
end
