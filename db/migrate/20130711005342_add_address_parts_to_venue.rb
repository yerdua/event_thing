class AddAddressPartsToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :address, :string
    add_column :venues, :city, :string
    add_column :venues, :country, :string
  end
end
