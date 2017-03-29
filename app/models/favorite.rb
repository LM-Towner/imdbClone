class Favorite < ApplicationRecord
  validates :user, :movie, { presence: true }
  belongs_to :user
  belongs_to :movie
end
