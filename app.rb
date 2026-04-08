require_relative 'user'
require_relative 'resource'
require_relative 'booking'

# 1. Create users [cite: 71]
alice = User.new(id: 1, name: "Alice", role: "student")
bob = User.new(id: 2, name: "Bob", role: "assistant")

# 2. Create resources [cite: 72]
microscope = Resource.new(id: 101, name: "Microscope", category: "Lab Gear")
laptop = Resource.new(id: 102, name: "Laptop", category: "Electronics")

puts "--- Step 3: Create valid booking ---"
booking1 = Booking.new(user: alice, resource: microscope)
puts "Alice booked the #{microscope.name}. Status: #{booking1.status}"

puts "\n--- Step 4 & 5: Try conflicting booking ---"
begin
  Booking.new(user: bob, resource: microscope)
rescue BookingError => e
  puts "Blocked: #{e.message}" # Confirms conflict is blocked [cite: 75]
end

puts "\n--- Step 6: Cancel booking ---"
booking1.cancel
puts "Booking cancelled. Resource available? #{microscope.available?}" # [cite: 77]

puts "\n--- Step 7: Re-booking ---"
booking2 = Booking.new(user: bob, resource: microscope)
puts "Bob successfully booked the #{microscope.name}."
