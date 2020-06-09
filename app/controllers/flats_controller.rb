class FlatsController < ApplicationController
  # before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
    if search_params[:location].present?
      @flats = @flats.where("location ILIKE ?", "%#{search_params[:location]}%")
    end

    if search_params[:separation_allowed].present?
      @flats = @flats.where("separation_allowed >= ?", "#{search_params[:separation_allowed]}")
    end

    if search_params[:dates].present?
      dates = search_params[:dates].split(" to ")
      start_at = Date.parse(dates[0]).strftime("%e %B %Y")
      end_at = Date.parse(dates[1]).strftime("%e %B %Y")
      @flats = @flats.joins(:bookings).where.not("(? >= bookings.start_date AND ? <= bookings.end_date) OR (? >= bookings.start_date AND ? <= bookings.end_date)", start_at, start_at, end_at, end_at)
    end

    @flats = @flats.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    if params[:dates]
      @dates = params[:dates].split
      @start_date = Date.parse(@dates[0]).strftime("%e %B %Y")
      @end_date = Date.parse(@dates[2]).strftime("%e %B %Y")
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to dashboard_path
  end

  private

  def search_params
    params.require(:search).permit(:separation_allowed, :location, :dates)
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :location, :flat_type, :number_of_rooms, :price_per_month, :separation_allowed, photos: [])
  end
end
