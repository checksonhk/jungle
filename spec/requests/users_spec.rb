require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do 
      @user = User.new(email: "temp@gmail.com" , name: "first_name last_name", password: "password", password_confirmation: "password")
      @user.save!
      @user
    end
    
    it "is valid with valid attributes" do 
      expect(@user).to be_valid
    end
    
    it "is not valid without a email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    
    it "is not valid without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end
    
    it "is not valid without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
    
    
    it "is not valid unless password and password_confirmation matches" do
      @user.password_confirmation = "mismatch"
      expect(@user).to_not be_valid
    end
    
    it "is not valid if a email already exist in the database" do
      @user2 = User.create(email: "temp@gmail.com", name: "name 2", password:"password", password_confirmation:"password")
      expect(@user2).to_not be_valid
    end
  end
  
  describe '.authenticate_with_credentials' do
    
    before(:each) do 
      @user = User.new(email: "temp@gmail.com" , name: "first_name last_name", password: "password", password_confirmation: "password")
      @user.save!
      @user
    end

    it "it should return a user if email and password match in db" do
      user = User.authenticate_with_credentials("temp@gmail.com", "password")
      expect(user).to eq(@user)
    end

    it "it should return null if email and password don't match" do
      user = User.authenticate_with_credentials("temp2@gmail.com", "wrong")
      expect(user).to be nil
    end

    it "it should return a user if email and password match in db regardless of spacing in email" do
      user = User.authenticate_with_credentials("  temp@gmail.com  ", "password")
      expect(user).to eq(@user)
    end

    it "it should return a user if email and password match in db regardless of casing in email" do
      user = User.authenticate_with_credentials("TeMp@GmaIl.com", "password")
      expect(user).to eq(@user)
    end




  end

end
