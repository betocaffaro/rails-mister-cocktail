# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: 'lemon')
# Ingredient.create(name: 'ice')
# Ingredient.create(name: 'mint leaves')
# Ingredient.create(name: 'vodka')
# Ingredient.create(name: 'rhum')
# Ingredient.create(name: 'tequila')
# Ingredient.create(name: 'orange juice')
# Ingredient.create(name: 'tomato juice')

require 'json'
require 'open-uri'

Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
drinks = JSON.parse(open(url).read)
puts 'retrieving ingredients list...'
drinks["drinks"].each do |i|
  Ingredient.create(name: i["strIngredient1"])
  puts "#{i["strIngredient1"]} added"
end
