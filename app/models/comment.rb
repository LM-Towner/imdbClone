class Comment < ApplicationRecord
  validates :text, :user, :commentable, { presence: true }

  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
