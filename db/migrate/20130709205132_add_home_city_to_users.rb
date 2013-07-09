class AddHomeCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :home_city_id, :integer
    add_index :users, :home_city_id
  end
end
