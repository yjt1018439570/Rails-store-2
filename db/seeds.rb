# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.where(email: "bbb@bbb.com").first_or_initialize
user.update!(
  password: "123456",
  password_confirmation: "123456"
)
products = [
  { name: 'Product 1', description: 'Description for product 1', price: 9.99 },
  { name: 'Product 2', description: 'Description for product 2', price: 19.99 },
  { name: 'Product 3', description: 'Description for product 3', price: 29.99 },
  { name: 'Product 4', description: 'Description for product 4', price: 39.99 },
  { name: 'Product 5', description: 'Description for product 5', price: 49.99 },
  { name: 'Product 6', description: 'Description for product 6', price: 59.99 },
  { name: 'Product 7', description: 'Description for product 7', price: 69.99 },
  { name: 'Product 8', description: 'Description for product 8', price: 79.99 },
]
Product.create(products)
