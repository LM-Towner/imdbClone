class Movie < ApplicationRecord
  validates :title, { presence: true }
  has_many :reviews
  has_many :comments, as: :commentable
  has_many :favoriting_users, through: :favorites, source: :user
  has_many :watchlisting_users, through: :watchlists, source: :user

  private
  has_many :favorites
  has_many :watchlists
end
