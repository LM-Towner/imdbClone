class Movie < ApplicationRecord
  validates :title, { presence: true }
  has_many :reviews
  has_many :comments, as: :commentable
  has_many :favoriting_users, through: :favorites, source: :user
  has_many :watchlisting_users, through: :watchlists, source: :user
  has_many :reviewing_users, through: :reviews, source: :user
  has_many :commenting_users, through: :comments, source: :user
  has_many :favorites
  has_many :watchlists
  private
  def self.search(search)
    where("title LIKE ? OR genre LIKE ? OR plot_summary LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
