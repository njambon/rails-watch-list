require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

for i in 1..100
  url = "http://tmdb.lewagon.com/movie/top_rated?&page=#{i}"
  URI.open(url) do |stream|
    films = JSON.parse(stream.read)["results"]
    films.each do |hash|
      movie = Movie.create(
        title: hash["original_title"],
        overview: hash['overview'],
        poster_url: "https://image.tmdb.org/t/p/original#{hash['backdrop_path']}",
        rating: hash['vote_average'])

      puts "Created #{movie.title}"
      end
    end
  end

puts "Movies created"
