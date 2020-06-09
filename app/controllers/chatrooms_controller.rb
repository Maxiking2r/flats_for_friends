class ChatroomsController < ApplicationController

  def index
    @user = current_user
    @bookings_as_renter = @user.bookings
    @bookings_as_owner = Booking.joins(:flat).where(flats: { user_id: current_user.id })
  end

  def show
    @booking = Booking.find(params[:id])
  end

end
