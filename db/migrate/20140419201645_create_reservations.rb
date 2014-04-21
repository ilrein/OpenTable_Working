class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.belongs_to :restaurant
    	t.belongs_to :user
    	t.datetime :reservation_date
      t.timestamps
    end
  end
end
