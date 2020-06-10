class MessagesController < ApplicationController

  def new
  end

  def create
    @message = Message.new(message_params)
    @booking = Booking.find(params[:booking_id])
    @message.booking = @booking
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@booking)
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:messages).permit(:content)
  end

end
