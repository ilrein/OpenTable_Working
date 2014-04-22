class ReservationsController < ApplicationController
  def index
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@reservation = Reservation.new
  end
  def new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
    @reservation.restaurant = @restaurant
    @reservation.party_size = params[:reservation][:party_size]
    
    new_reserv = DateTime.strptime(params[:reservation][:reservation_date], "%m/%d/%Y").to_date
    @reservation.reservation_date = new_reserv
    @reservation.rtime = params[:rtime]
    
    if !@restaurant.check_seats(@reservation.party_size, @reservation.reservation_date, @reservation.rtime)
      flash[:alert] = "Oh no! No more seats left."
      redirect_to restaurants_path(@reservation.restaurant.id)
    else
      @reservation.save
      flash[:alert] = "Reservation made!"
      @reserved_count = @restaurant.reserved_count(@reservation.party_size)
    end
  end

  def destroy
  end

  def show
  end

end
