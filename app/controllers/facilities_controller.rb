class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    @facilities = @facilities.where("sports_name LIKE ?", "%#{params[:sports_name]}%") if params[:sports_name].present?
    @facilities = @facilities.where("pincode = ?", params[:pincode]) if params[:pincode].present?
  end

  def show
    @facility = Facility.find(params[:id])
    @bookings = @facility.bookings.order(:booking_time)
  end
end
