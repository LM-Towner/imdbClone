require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { Review.new }
  describe "attributes" do
    it "has a rating" do
      expect(review.has_attribute?(:rating)).to be true
    end

    it "has text" do
      expect(review.has_attribute?(:text)).to be true
    end

    it "has a user id" do
      expect(review.has_attribute?(:user_id)).to be true
    end

    it "has a movie id" do
      expect(review.has_attribute?(:movie_id)).to be true
    end

    it "has timestamps" do
      expect(review.has_attribute?(:created_at) && review.has_attribute?(:updated_at)).to be true
    end
  end

  describe "validations" do
    it "is invalid with no rating" do
      user = User.new
      movie = Movie.new
      review.text = 'some text'
      review.user = user
      review.movie = movie
      review.valid?
      expect(review.errors).not_to be_empty
    end

    it "is invalid with a rating that is less than 1" do
      user = User.new
      movie = Movie.new
      review.rating = 0
      review.text = 'some text'
      review.user = user
      review.movie = movie
      review.valid?
      expect(review.errors).not_to be_empty
    end

    it "is invalid with a rating that is greater than 4" do
      user = User.new
      movie = Movie.new
      review.rating = 10
      review.text = 'some text'
      review.user = user
      review.movie = movie
      review.valid?
      expect(review.errors).not_to be_empty
    end

    it "is invalid without text" do
      user = User.new
      movie = Movie.new
      review.rating = 3
      review.user = user
      review.movie = movie
      review.valid?
      expect(review.errors).not_to be_empty
    end

    it "is invalid without a user" do
      movie = Movie.new
      review.rating = 3
      review.text = 'some text'
      review.movie = movie
      review.valid?
      expect(review.errors).not_to be_empty
    end

    it "is invalid without a movie" do
      user = User.new
      review.text = 'some text'
      review.rating = 3
      review.user = user
      review.valid?
      expect(review.errors).not_to be_empty
    end

    it "is valid with a review 1-4, a user and a movie" do
      user = User.new
      movie = Movie.new
      review.rating = 3
      review.text = 'some text'
      review.user = user
      review.movie = movie
      review.valid?
      expect(review.errors).to be_empty
    end
  end

  describe "associations" do
    it "belongs to a user" do
      user = User.new
      review.user = user
      expect(review.user).to eq user
    end

    it "belongs to a movie" do
      movie = Movie.new
      review.movie = movie
      expect(review.movie).to eq movie
    end

    it "has many comments" do
      comment = Comment.new
      comment2 = Comment.new
      review.comments << comment
      review.comments << comment2
      expect(review.comments).to match_array [comment, comment2]
    end
  end
end
