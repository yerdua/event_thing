class AddUrlToVenueAndEvent < ActiveRecord::Migration
  def change
    add_column :venues, :url, :string
    add_column :events, :url, :string
  end
end
