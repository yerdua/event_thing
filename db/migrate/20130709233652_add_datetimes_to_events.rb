class AddDatetimesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :datetime, null: false
    add_column :events, :end_time, :datetime, null: false
    
    add_index :events, :start_time
  end
end
