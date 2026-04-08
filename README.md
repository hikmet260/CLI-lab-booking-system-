# CLI Lab Booking System

This is my CLI (Command Line Interface) project for the Lab Booking System. It's built in Ruby and handles everything through the terminal. It manages users, tracks lab resources, and makes sure nobody tries to book the same microscope at the same time.

## 📁 What's inside?
I've organized the project into these files to keep the logic clean:
* `app.rb` - Run this to see the demo of the system working.
* `booking.rb` - This is where the magic happens (booking logic & status).
* `resource.rb` - Keeps track of things like microscopes and if they are free.
* `user.rb` - Basic info for students and assistants.
* `errors.rb` - Custom error messages so the program doesn't just crash.
* `test/` - A folder containing `test_booking.rb` to make sure everything actually works.

## 🚀 How to use it
To see the system in action, just run:
`ruby app.rb`

To run the automated tests:
`ruby test/test_booking.rb`

## 📝 A few thoughts on the project
**The Easy Stuff:**
Setting up the classes for Users and Resources was pretty chill. Ruby makes it easy to define attributes.

**The Hard Stuff:**
Git. Definitely Git. Trying to get the folder structure right while moving things around in the terminal was a massive headache. Also, making sure the Resource automatically becomes "available" again right when a booking is cancelled took a few tries to get the logic right.

**Bugs & Fixes:**
I ran into a weird "Device busy" error in the Fedora terminal while moving files. I figured out I was trying to move a folder I was currently sitting in. I fixed it by jumping back to the Desktop (`cd ..`) and then moving it from the outside.
