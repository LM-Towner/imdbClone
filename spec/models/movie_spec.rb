require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { Movie.new }
  describe "attributes" do
    it "has a title" do
      expect(movie.has_attribute?(:title)).to be true
    end

    it "has a genre" do
      expect(movie.has_attribute?(:genre)).to be true
    end

    it "has a release date" do
      expect(movie.has_attribute?(:release_date)).to be true
    end

    it "has a plot summary" do
      expect(movie.has_attribute?(:plot_summary)).to be true
    end

    it "has a production company" do
      expect(movie.has_attribute?(:production)).to be true
    end

    it "has a poster" do
      expect(movie.has_attribute?(:poster)).to be true
    end

    it "has a website" do
      expect(movie.has_attribute?(:website)).to be true
    end

    it "has timestamps" do
      expect(movie.has_attribute?(:created_at) && movie.has_attribute?(:updated_at)).to be true
    end
  end

  describe "validations" do
    it "is invalid without a title" do
      movie.valid?
      expect(movie.errors).not_to be_empty
    end

    it "is valid with a title, other attributes are irrelevant" do
      movie.title = 'a title'
      movie.valid?
      expect(movie.errors).to be_empty
    end
  end

  describe "associations" do
    it "has many reviews" do
      review = Review.new
      review2 = Review.new
      movie.reviews << review
      movie.reviews << review2
      expect(movie.reviews).to match_array [review, review2]
    end

    it "has many comments" do
      comment = Comment.new
      comment2 = Comment.new
      movie.comments << comment
      movie.comments << comment2
      expect(movie.comments).to match_array [comment, comment2]
    end
    context "second degree associations" do
      pending "has many favoriting users, which are the users that have favorited it" do
      end

      pending "has many watchlisting users, which are the users that have watchlisted it" do
      end

      pending "has many reviewing users, which are the users that have reviewed it" do
      end

      pending "has many commenting users, which are the users that have commented on it" do
      end
    end
  end
end
