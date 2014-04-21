class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :Users, through: :reservations
end
