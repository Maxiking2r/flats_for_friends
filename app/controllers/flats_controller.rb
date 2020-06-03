class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

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

    def new
      @flat = Flat.new
    end

    def show
      @flat = Flat.find(params[:id])
    end
  end
end
