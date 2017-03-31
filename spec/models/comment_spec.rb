require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { Comment.new }
  describe "attributes" do
    it "has text" do
      expect(comment.has_attribute?(:text)).to be true
    end

    it "has a user id" do
      expect(comment.has_attribute?(:user_id)).to be true
    end

    it "has a commentable id" do
      expect(comment.has_attribute?(:commentable_id)).to be true
    end

    it "has a commentable type" do
      expect(comment.has_attribute?(:commentable_type)).to be true
    end

    it "has timestamps" do
      expect(comment.has_attribute?(:created_at) && comment.has_attribute?(:updated_at)).to be true
    end
  end

  describe "validations" do
    it "is invalid without any text" do
      user = User.new
      movie = Movie.new
      comment.user = user
      comment.commentable = movie
      comment.valid?
      expect(comment.errors).not_to be_empty
    end

    it "is invalid without a user" do
      movie = Movie.new
      comment.text = 'some text'
      comment.commentable = movie
      comment.valid?
      expect(comment.errors).not_to be_empty
    end

    it "is invalid without a commentable" do
      user = User.new
      comment.text = 'some text'
      comment.user = user
      comment.valid?
      expect(comment.errors).not_to be_empty
    end

    it "is valid with a user, commentable and text" do
      user = User.new
      movie = Movie.new
      comment.text = 'some text'
      comment.user = user
      comment.commentable = movie
      comment.valid?
      expect(comment.errors).to be_empty
    end
  end

  describe "associations" do
    it "belongs to a user" do
      user = User.new
      comment.user = user
      expect(comment.user).to eq user
    end

    it "belongs to a commentable which can be a movie" do
      movie = Movie.new
      comment.commentable = movie
      expect(comment.commentable).to eq movie
    end

    it "belongs to a commentable which can be a review" do
      review = Review.new
      comment.commentable = review
      expect(comment.commentable).to eq review
    end

    it "belongs to a commentable which can be another comment" do
      comment2 = Comment.new
      comment.commentable = comment2
      expect(comment.commentable).to eq comment2
    end
  end
end
