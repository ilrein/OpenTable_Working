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
    
    if !check_seats(@reservation.party_size, @reservation.reservation_date, @reservation.rtime, @restaurant.capacity)
      flash[:alert] = "Oh no! No more seats left."
      redirect_to restaurants_path(@reservation.restaurant.id)
    else
      #@reservation.save
      flash[:alert] = "Reservation made!"
    end
  end

  def destroy
  end

  def show
  end
  private
  def check_seats(party_size, reservation_date, rtime, capacity)
    @reservations = Reservation.where("reservation_date = ?", reservation_date)
    @reservations = @reservations.where("rtime = ?", rtime)
    @reserved_count = @reservations.sum(:party_size) + party_size
    if @reserved_count >= capacity
      return false
    else return true
    end
  end 
end
