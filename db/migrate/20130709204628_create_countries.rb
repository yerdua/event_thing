class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.timestamps
    end
    
    add_index :countries, :name, uniqueness: true
  end
end
