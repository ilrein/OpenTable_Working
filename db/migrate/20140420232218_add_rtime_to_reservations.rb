class AddRtimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :rtime, :string
  end
end
