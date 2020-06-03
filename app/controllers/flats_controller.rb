class FlatsController < ApplicationController
  # before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index

    @flats = Flat.all

    if params[:location].present?
      @flats = @flats.where("location ILIKE ?", "%#{params[:location]}%")
    end

    if params[:separation_allowed].present?
      @flats = @flats.where("separation_allowed >= ?", "#{params[:separation_allowed]}")
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

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :location, :flat_type, :number_of_rooms, :price_per_month, :separation_allowed, photos: [])
  end
end
