# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "rest-client"

puts "running"

response = RestClient.get "http://tmdb.lewagon.com/movie/top_rated"
repos = JSON.parse(response)

movie_list = repos["results"]

movie_list.each do |movie|
  puts "Creating #{movie["title"]}"
  new_movie = Movie.new(  title:      movie["title"],
                          overview:   movie["overview"],
                          poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
                          rating:     movie["vote_average"]
  )
  new_movie.save
end

puts "done!"
