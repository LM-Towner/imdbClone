# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

OMDB_BASEURL = 'http://www.omdbapi.com/?apikey=1394a166?'

['tt3748528', 'tt0076759', 'tt0080684', 'tt0086190', 'tt0120915', 'tt0121765', 'tt0121766', 'tt2488496'].each do |id|
  uri = (OMDB_BASEURL + "i=#{id}")
  response = Net::HTTP.get(uri)
  movie = JSON.parse(response)

  Movie.create(title: movie[:Title],
               genre: movie[:Genre],
               release_date: DateTime.parse(movie[:Released]),
               plot_summary: movie[:Plot],
               production: movie[:Production],
               poster: movie[:Poster],
               website: movie[:Website])
end
