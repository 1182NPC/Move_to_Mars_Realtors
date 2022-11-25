# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

name = ""

description_one = "#{Faker::Name.name} invites you to expand your horizons by visiting #{name}"
description_two = "Visit mars today! #{name} is located in a beautiful part of #{Faker::Books::Dune.city}"
description_three = "Have you ever considered moving to mars? Start a new life off-planet today in #{name}"
description_arr = [description_one, description_two, description_three]


puts "Cleaning up database..."
Trip.delete_all
User.delete_all

puts "Creating trips"
test_user = User.create(
  email: "test.email@google.com",
  password: "123456"
)

def multiple(name, description_arr, test_user)
  name = Faker::Space.star_cluster
  multi_trip = Trip.create(
    name: name,
    price: rand(10..1000).to_i,
    description: description_arr.sample,
    user: test_user
  )
  multi_path = File.join(Rails.root, "app/assets/images/multi_image_seed")
  multi_trip.photos.attach(io: File.open("#{multi_path}/multi_seed1.jpg"), filename: "multi_seed1.jpg", content_type: "image/jpeg")
  multi_trip.photos.attach(io: File.open("#{multi_path}/multi_seed2.jpg"), filename: "multi_seed2.jpg", content_type: "image/jpeg")
  multi_trip.photos.attach(io: File.open("#{multi_path}/multi_seed3.jpg"), filename: "multi_seed3.jpg", content_type: "image/jpeg")
end


def single(name, description_arr, test_user)
  29.times do
    name = Faker::Space.star_cluster
    test_trip = Trip.create(
    name: name,
    price: rand(10..1000).to_i,
    description: description_arr.sample,
    user: test_user
  )
  image_path = "seed_image#{rand(1..6)}.jpg"
  path = File.join(Rails.root, "app/assets/images/#{image_path}")
  test_trip.photos.attach(io: File.open(path), filename: image_path, content_type: "image/jpeg")

  end
end

multiple(name, description_arr, test_user)
single(name, description_arr, test_user)

puts "Finished!"
