class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = current_user.bookings.build(booking_params)


  Rails.logger.debug "Booking Params: #{booking_params.inspect}"
  Rails.logger.debug "Booking Details: #{@booking.inspect}"
  
    if @booking.save
      redirect_to facility_path(@booking.facility), notice: 'Booking was successful.'
    else
      redirect_to facility_path(@booking.facility), alert: 'Booking failed. This slot might already be booked.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:facility_id, :booking_time, :duration)
  end
end
