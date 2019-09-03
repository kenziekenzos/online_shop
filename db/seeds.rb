# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 require 'faker'

#  Item.create( title:string, description:text, price:decimal, image_url:string)
User.destroy_all
Item.destroy_all

#ITEM
 def prepare
    title = Faker::Name.first_name
 description = Faker::Lorem.paragraph
 price = Faker::Number.decimal(l_digits: 2)
 image_url = Faker::LoremPixel.image(size: "100x100", is_gray: false, category: 'cats')
    {title: title, description: description, price: price, image_url: image_url}
  end

  10.times do
    item = Item.create(prepare)
  end
  puts "\nTotal item created: #{Item.all.count}"


  10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 6),)
  end
  puts "\nTotal user created: #{User.all.count}"

  puts "\nTotal cart count: #{Cart.all.count}"
