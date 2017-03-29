require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { Favorite.new }
  describe "attributes" do
    it "has a user id" do
      expect(favorite.has_attribute?(:user_id)).to be true
    end

    it "has a movie id" do
      expect(favorite.has_attribute?(:movie_id)).to be true
    end

    it "has timestamps" do
      expect(favorite.has_attribute?(:created_at) && favorite.has_attribute?(:updated_at)).to be true
    end
  end

  describe "validations" do
    it "is invalid without a user" do
      movie = Movie.new
      favorite.movie = movie
      favorite.valid?
      expect(favorite.errors).not_to be_empty
    end

    it "is invalid without a movie" do
      user = User.new
      favorite.user = user
      favorite.valid?
      expect(favorite.errors).not_to be_empty
    end

    it "is valid with both a user and a movie" do
      user = User.new
      movie = Movie.new
      favorite.user = user
      favorite.movie = movie
      favorite.valid?
      expect(favorite.errors).to be_empty
    end
  end

  describe "associations" do
    it "belongs to a user" do
      user = User.new
      favorite.user = user
      expect(favorite.user).to eq user
    end

    it "belongs to a movie" do
      movie = Movie.new
      favorite.movie = movie
      expect(favorite.movie).to eq movie
    end
  end
end
