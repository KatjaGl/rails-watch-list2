# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
require 'faker'
require 'json'
require 'open-uri'

puts 'Creating 10 fake movies...'
10.times do
  movie = Movie.new(
    title: Faker::Movie.unique.title,
    overview: Faker::Movie.unique.quote,
    rating: rand(0..5)
  )
  movie.save
end
puts 'Finished!'

url = "https://tmdb.lewagon.com/movie/top_rated"
all_movies = URI.open(url).read
movies = JSON.parse(all_movies)

puts "#{movies["results"]}"

movies["results"].take(20).each do |m|
  movie = Movie.new(
    title: m["original_title"].capitalize,
    overview: m["overview"].capitalize,
    poster_url: m["poster_path"],
    rating: m["vote_average"]
  )
  movie.save
end
puts 'seed imdb done'
