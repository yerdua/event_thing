class AddStateToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :state_code, :string
  end
end
