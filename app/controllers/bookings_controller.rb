class BookingsController < ApplicationController
  # before_action :set_flat, only: [:create, :new]

  def new
    @flat = Flat.find(params[:flat_id])
    if params[:dates]
      @dates = params[:dates].split
      @start_date = Date.parse(@dates[0]).strftime("%e %B %Y")
      @end_date = Date.parse(@dates[2]).strftime("%e %B %Y")
      @booking = Booking.new(start_date: @start_date, end_date: @end_date)
    else
      @booking = Booking.new
    end
  end


  def show
    @booking = Booking.find(params[:id])

    @flat = [@booking.flat] # returns bookings with coordinates

    @markers = @flat.map do |booking|
      {
        lat: booking.latitude,
        lng: booking.longitude
      }
    end
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

  def index
    @user = current_user
    @bookings_as_renter = @user.bookings
    @bookings_as_owner = Booking.joins(:flat).where(flats: { user_id: current_user.id })
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

  def update
    @booking = Booking.find(params[:id])
    @message = Message.new(content: params["booking"]["messages_attributes"]["0"]["content"])
    @message.user = current_user
    @message.booking = @booking
    if @message.save
      redirect_to chatroom_path(@booking)
    else
      render "chatrooms/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date,messages_attributes: [:content])
  end
end
