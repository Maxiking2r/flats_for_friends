class FlatsController < ApplicationController
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save

    redirect_to flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :location, :type, :number_of_rooms, :price_per_month, :separation_allowed)
  end
end
