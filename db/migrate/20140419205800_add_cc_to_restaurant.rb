class AddCcToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :current_capacity, :integer
  end
end
