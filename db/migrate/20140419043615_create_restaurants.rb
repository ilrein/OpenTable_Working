class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image
      t.integer :capacity

      t.timestamps
    end
  end
end
