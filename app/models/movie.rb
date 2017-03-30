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
  private
  has_many :favorites
  has_many :watchlists

  def self.database_query(query)

    uri = URI(URL + "t=#{query}")
    response = Net::HTTP.get(uri)
    movie = JSON.parse(response)

    if self.find_by(title: query)
      return self.preload(:reviews, :comments, :reviewing_users, :commenting_users).find_by(title: query)
    else
      if movie["Response"] == "True"
        self.create(title: movie["Title"],
                     genre: movie["Genre"],
                     release_date: DateTime.parse(movie["Released"]),
                     plot_summary: movie["Plot"],
                     production: movie["Production"],
                     poster: movie["Poster"],
                     website: movie["Website"])
      else
        movie["Error"]
      end
    end



  end





end
