class RestaurantsController < ApplicationController
  def index
  	@all = Restaurant.all
  	@reservation = Reservation.new 	
  end
  def show
  end
  
end
