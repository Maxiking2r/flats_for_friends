class DashboardsController < ApplicationController
  def dashboard
    @user = current_user
    @bookings_as_owner = Booking.joins(:flat).where(flats: { user_id: @user.id })
    @flats = @user.flats
  end
end
