class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.integer :venue_id
      
      t.timestamps
    end
    
    add_index :events, :venue_id
    add_index :events, :title
  end
end
