require 'net/http'
require 'json'
require 'yaml'

class Movie < ApplicationRecord
  URL = 'http://www.omdbapi.com/?'
  validates :title, { presence: true }
  has_many :reviews
  has_many :comments, as: :commentable
  has_many :favoriting_users, through: :favorites, source: :user
  has_many :watchlisting_users, through: :watchlists, source: :user
  has_many :reviewing_users, through: :reviews, source: :user
  has_many :commenting_users, through: :comments, source: :user
  has_many :favorites
  has_many :watchlists

  def self.database_query(query)

    if self.find_by(title: query)
      return self.find_by(title: query)
    else
      uri = URI(URL + "t=#{query}")
      response = Net::HTTP.get(uri)
      response = JSON.parse(response)
      if response["Response"] == "True"
        movie = self.new(title: response["Title"],
                     genre: response["Genre"],
                     release_date: DateTime.parse(response["Released"]),
                     plot_summary: response["Plot"],
                     production: response["Production"],
                     poster: response["Poster"],
                     website: response["Website"])
        movie.save
        movie
      else
        response["Error"]
      end
    end
  end





end
