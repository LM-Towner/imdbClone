class Comment < ApplicationRecord
  validates :text, :user, :commentable, { presence: true }
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def find_closest_movie_id
    if self.commentable.is_a?(Movie)
      return self.commentable_id
    elsif self.commentable.is_a?(Review)
      return self.commentable.movie.id
    else
      self.commentable.find_closest_movie_id
    end
  end
end
