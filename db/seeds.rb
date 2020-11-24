# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
baby_products = ["chupeta", "macacao", "chocalho", "mamadeira", "berço", "vestido"]
product_brands = ["CK", "Dior", "Estrela", "Fisher Price"]

10.times do
 u = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name ,
  email: Faker::Internet.email,
  password: "123456"
 )

 Product.create(
  name: baby_products.sample,
  brand: product_brands.sample,
  description: Faker::Lorem.sentence(word_count: 6),
  price: rand(5..150),
  owner: u
 )

end