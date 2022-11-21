# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# puts "Cleaning up database..."
# Trips.destroy
puts "Creating trips"

test_trip = Trip.create!(
  name: "A test trip",
  price: 70,
  description: "Why a test trip you ask? MSC is testing out the very latest in rocket technology - save 15% on your
                booking by flying with us today"
)

path = File.join(Rails.root, 'app/assets/images/seed_image.jpg')
Trip.find(1).photos.attach(io: File.open(path), filename: "seed_image.jpg", content_type: "image/jpeg")
