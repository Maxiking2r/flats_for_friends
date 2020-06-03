class FlatsController < ApplicationController
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

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :location, :flat_type, :number_of_rooms, :price_per_month, :separation_allowed, photos: [])
  end
end
