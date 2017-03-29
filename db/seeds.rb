# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

OMDB_BASEURL = 'http://www.omdbapi.com/?'


['tt3748528', 'tt0076759', 'tt0080684', 'tt0086190', 'tt0120915', 'tt0121765', 'tt0121766', 'tt2488496'].each do |id|
  uri = URI(OMDB_BASEURL + "i=#{id}")
  response = Net::HTTP.get(uri)
  movie = JSON.parse(response)
  Movie.create(title: movie["Title"],
               genre: movie["Genre"],
               release_date: DateTime.parse(movie["Released"]),
               plot_summary: movie["Plot"],
               production: movie["Production"],
               poster: movie["Poster"],
               website: movie["Website"])
end

5.times do
  User.create(username: Faker::Internet.user_name,
              email: Faker::Internet.email,
              password: 'password')
end

10.times do
  random_user = User.all.sample
  random_movie = Movie.all.sample
  Watchlist.create(user: random_user,
                   movie: random_movie)
end

10.times do
  random_user = User.all.sample
  random_movie = Movie.all.sample
  Favorite.create(user: random_user,
                   movie: random_movie)
end

10.times do
  random_user = User.all.sample
  random_movie = Movie.all.sample
  text = Faker::Hipster.paragraph(4)
  Review.create(user: random_user,
                movie: random_movie,
                rating: rand(3)+1,
                text: Faker::Hipster.paragraph(4))
end

30.times do
  random_user = User.all.sample
  random_movie = Movie.all.sample
  text = Faker::Hipster.paragraph(4)
  Comment.create(user: random_user,
                 commentable_id: random_movie.id,
                 text: text,
                 commentable_type: "Movie")
end
