class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :comments, as: :commentable
end
