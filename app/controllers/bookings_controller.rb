class BookingsController < ApplicationController
  # before_action :set_flat, only: [:create, :new]

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def index
    @user = current_user
    @bookings_as_renter = @user.bookings
    @bookings_as_owner = Booking.joins(:flat).where(flats: { user_id: current_user.id })
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user
    @booking.messages.last.user = current_user
    if @booking.save
      redirect_to chatrooms_path
    else
      render :new
    end
  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.confirmed = "confirmed"
    @booking.save
    redirect_to dashboard_path
  end

  def declined
    @booking = Booking.find(params[:id])
    @booking.confirmed = "declined"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, messages_attributes: [:content])
  end
end
