require 'rails_helper'

describe User do
  let(:user) { User.new}
  describe "User is valid" do
    it 'has a username' do
      user.username = "apples"
      expect(user.username).to eq "apples"
    end
    it 'has a email address' do
      user.email = 'apples@gmail.com'
      expect(user.email).to eq "apples@gmail.com"
    end
    it 'has a password' do
      user.password = 'password'
      expect(user.password).to eq 'password'
    end
  end
  describe 'user has a valid password' do
    it "validation allows passwords  between 6 and 20 characters" do
      password = User.create(username: 'something', email: "tester2@gmail.com")
      password.password = "password123"
      expect(password).to be_valid
    end

    it "error is thrown if user's password is more than 20 characters" do
      password = User.create(username: 'something', email: "test@gmail.com")
      password.password = "password123reuhfdibcjkfbdkscohioewhkdsnohujkdsbvbifsbsdvcb0493ewu0idjsc"
      expect(password).to be_invalid
    end
    it "error is thrown if user's password is less than 6 characters" do
      password = User.create(username: 'something', email: "tester2@gmail.com")
      password.password = "123"
      expect(password).to be_invalid
    end
   end

   describe 'email uniquness for users' do
     it "allows user to be saved when email is not in the database" do
       email = User.create(username: 'something', password: "password123")
       email.email = 'test@gmail.com'
       expect(email.save).to be(true)
     end

     it "only allows email if not found in the database" do
       user1 = User.create!(username: 'something', password: "password123", email: "test@gmail.com")
       user2 = User.new(username: 'something', password: "password123", email: "test@gmail.com")
       expect(user2.save).to be(false)
     end
   end
 end
