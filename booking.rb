require_relative 'errors'

class Booking
  attr_reader :user, :resource, :status, :created_at

  def initialize(user:, resource:)
    # Rule: a resource that is already booked cannot be booked again [cite: 38]
    raise BookingError, "Resource is already booked!" unless resource.available?

    @user = user
    @resource = resource
    @status = "active" # A booking starts as active [cite: 39]
    @created_at = Time.now
    
    # Update resource state [cite: 93]
    @resource.assign_booking(self)
  end

  def cancel
    @status = "cancelled"
    @resource.clear_booking # Cancelling makes the resource available again [cite: 40]
  end
end
