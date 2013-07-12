class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :event_id
      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :event_id
  end
end
