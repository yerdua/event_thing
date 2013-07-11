class DropCityAndCountryTables < ActiveRecord::Migration
  def change
    drop_table :cities
    drop_table :countries
  end
end
