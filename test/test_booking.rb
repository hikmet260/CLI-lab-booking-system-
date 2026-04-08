require "minitest/autorun"
require_relative "../user"
require_relative "../resource"
require_relative "../booking"
require_relative "../errors"

class BookingTest < Minitest::Test
  # This runs before every single test to give us fresh data
  def setup
    @user = User.new(id: 1, name: "Mahi", role: "student")
    @resource = Resource.new(id: 1, name: "Microscope", category: "lab")
  end

  # Test 1: Can we actually book something?
  def test_successful_booking
    booking = Booking.new(user: @user, resource: @resource)
    assert_equal "active", booking.status
    assert_equal false, @resource.available?
  end

  # Test 2: Does it block double-booking?
  def test_prevent_double_booking
    # First booking works
    Booking.new(user: @user, resource: @resource)
    
    # Second booking should fail with our custom error
    assert_raises(BookingError) do
      Booking.new(user: @user, resource: @resource)
    end
  end

  # Test 3: Does cancellation work?
  def test_cancellation_logic
    booking = Booking.new(user: @user, resource: @resource)
    booking.cancel
    
    assert_equal "cancelled", booking.status
    assert_equal true, @resource.available?
  end
end
