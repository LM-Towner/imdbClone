class User < ApplicationRecord
  has_many :reviews
  has_many :comments
  has_many :favorites
  has_many :watchlist
  has_many :favorite_movies, through: :favorites, source: :movies
  has_many :watchlist_movies, through: :watchlists, source: :movies

  validates :username, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {in: 6..20}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
