class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name iLike '%#{params[:query]}%'")
    else
      @flats = Flat.all
    end

    @flats = Flat.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      # redirect_to flat_path(@flat)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :location, :flat_type, :number_of_rooms, :price_per_month, :separation_allowed, photos: [])
  end
end
