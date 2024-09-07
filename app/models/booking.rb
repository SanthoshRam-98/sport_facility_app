class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :facility

  validate :no_double_booking

  private

  def no_double_booking
    existing_bookings = Booking.where(facility_id: facility_id).where.not(id: id)
  
    existing_bookings.each do |existing_booking|
      if overlaps?(existing_booking)
        errors.add(:booking_time, 'overlaps with another booking')
        break
      end
    end
  end
  

  def overlaps?(existing_booking)
    return false unless duration.present? && existing_booking.duration.present?
    new_booking_start = booking_time
    new_booking_end = booking_time + (duration || 0).hours
  
    existing_booking_start = existing_booking.booking_time
    existing_booking_end = existing_booking.booking_time + (existing_booking.duration || 0).hours
  
    new_booking_start < existing_booking_end && new_booking_end > existing_booking_start
  end 
  
end
