class Review < ApplicationRecord
  validates :text, :movie, :user, { presence: true }
  validates :rating, { presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 } }
  belongs_to :movie
  belongs_to :user
  has_many :comments, as: :commentable
end
