# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Delete existing records
Review.destroy_all
Restaurant.destroy_all

# Create restaurants
restaurants = [
  {
    name: "Pizza Roma",
    address: "Montreal",
    category: "italian"
  },
  {
    name: "Dragon Palace",
    address: "Laval",
    category: "chinese"
  },
  {
    name: "Sakura Sushi",
    address: "Quebec City",
    category: "japanese"
  },
  {
    name: "Le Petit Bistro",
    address: "Montreal",
    category: "french"
  },
  {
    name: "Belgian Waffle House",
    address: "Longueuil",
    category: "belgian"
  }
]

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end

puts "#{Restaurant.count} restaurants created successfully!"
