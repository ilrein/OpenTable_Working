class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations
	
	def check_seats(party_size, reservation_date, rtime)
		reservations = Reservation.where("reservation_date = ? and rtime = ? and restaurant_id = ?", reservation_date, rtime, self.id)
		if reserved_count(party_size) > self.capacity
			return false
		else 
			return true
		end
	end 
	def reserved_count(party_size)
		reserved_count = reservations.sum(:party_size) + party_size
	end

end
