class RestaurantsController < ApplicationController
	def index
		@all = Restaurant.all
		@reservation = Reservation.new
		@restaurants = if params[:search]
			Restaurant.where("name ILIKE ?", "%#{params[:search]}%")
		else
			Restaurant.all 
		end

	    if request.xhr?
	      return render @restaurants
	    end		

	end


end
