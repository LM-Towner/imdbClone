class User < ApplicationRecord
  has_many :reviews
  has_many :comments
  has_many :favorite_movies, through: :favorites, source: :movie
  has_many :watchlist_movies, through: :watchlists, source: :movie

  validates :user, :email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  private

  has_many :favorites
  has_many :watchlist
end
