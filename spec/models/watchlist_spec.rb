require 'rails_helper'

RSpec.describe Watchlist, type: :model do
  let(:watchlist) { Watchlist.new }
  describe "attributes" do
    it "has a user id" do
      expect(watchlist.has_attribute?(:user_id)).to be true
    end

    it "has a movie id" do
      expect(watchlist.has_attribute?(:movie_id)).to be true
    end

    it "has timestamps" do
      expect(watchlist.has_attribute?(:created_at) && watchlist.has_attribute?(:updated_at)).to be true
    end
  end

  describe "validations" do
    it "is invalid without a movie" do
      user = User.new
      watchlist.user = user
      watchlist.valid?
      expect(watchlist.errors).not_to be_empty
    end

    it "is invalid without a user" do
      movie = Movie.new
      watchlist.movie = movie
      watchlist.valid?
      expect(watchlist.errors).not_to be_empty
    end

    it "is valid with both a user and a movie" do
      user = User.new
      movie = Movie.new
      watchlist.movie = movie
      watchlist.user = user
      watchlist.valid?
      expect(watchlist.errors).to be_empty
    end
  end

  describe "associations" do
    it "belongs to a user" do
      user = User.new
      watchlist.user = user
      expect(watchlist.user).to eq user
    end

    it "belongs to a movie" do
      movie = Movie.new
      watchlist.movie = movie
      expect(watchlist.movie).to eq movie
    end
  end
end
