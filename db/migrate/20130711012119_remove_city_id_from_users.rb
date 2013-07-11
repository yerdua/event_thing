class RemoveCityIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :home_city_id
  end
end
