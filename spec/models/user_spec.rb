require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations:' do
    it "requires a name, email, password and password confirmation and the two passwords fields must match" do
      user = User.create(
        name: "Mike",
        email: "Mike@Ike",
        password: "123",
        password_confirmation: "123"
      )
      expect(user).to be_valid
      expect(user.password).to eq(user.password_confirmation)
    end
    it "fails when the two password inputs are different" do
      user = User.create(
        name: "Mike",
        email: "Mike@Ike",
        password: "123",
        password_confirmation: "321"
      )
      expect(user.password).to_not eq(user.password_confirmation)
      expect(user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]
    end
      it "requires a password" do
        user = User.create(
          name: "Joe",
          email: "Mike@Ike",
          password: nil,
          password_confirmation: "123"
        )
        expect(user).to_not be_valid
        expect(user.errors.full_messages.first).to eq "Password can't be blank"
    end
    it "requires a password_confirm" do
      user = User.create(
        name: "Joe",
        email: "Mike@Ike",
        password: "123",
        password_confirmation: nil
        
      )
      
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "Password confirmation can't be blank"
      
    end
    it "requires a name" do
      
      user = User.create(
          email: "Mike@Ike",
          password: "123",
          password_confirmation: "123"
        )
     
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "Name can't be blank"
    end
    it "requires an email" do
      
      user = User.create(
          name: "Mike",
          email: nil,
          password: "123",
          password_confirmation: "123"
        )
      
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "Email can't be blank"
    end
    it "email is case sensistive and same emails cannot be added" do
      user = User.create(
        name: "Mike",
        email: "Mike@Ike",
        password: "123",
        password_confirmation: "123"
      )
      user1 = User.create(
        name: "Mike",
        email: "mike@ike",
        password: "123",
        password_confirmation: "123"
      )
      expect(user1).to_not be_valid
      expect(user).to be_valid 
     
    end
    it "password must be atleast 3 chars" do
      user = User.create(
        name: "Mike",
        email: "Mike@Ike",
        password: "12",
        password_confirmation: "12"
      )
      user1 = User.create(
        name: "Mike",
        email: "mike@jordan",
        password: "123",
        password_confirmation: "123"
      )
      expect(user).to_not be_valid
      expect(user1).to be_valid
      expect(user.errors.full_messages.first).to eq "Password is too short (minimum is 3 characters)"

    end
  end
  describe '.authenticate_with_credentials' do
    it "logs a person in if you have the right username and password" do
      @user = User.create(
        name: "Mike",
        email: "Mike@Ike",
        password: "123",
        password_confirmation: "123"
      )
      login = @user.authenticate_with_credentials(@user.email, @user.password)
      expect(login).to be_truthy
      
    end
    it "logs a person in if you have the right username and password even if there is whitespace in the email" do
      @user = User.create(
        name: "Mike",
        email: "Mike@Ike",
        password: "123",
        password_confirmation: "123"
      )
      login = @user.authenticate_with_credentials("     Mike@Ike    ", @user.password)
      expect(login).to be_truthy
    end
    it "fails to login if email is wrong" do
      @user = User.create(
        name: "Mike",
        email: "Mike@Ike",
        password: "123",
        password_confirmation: "123"
      )
      login = @user.authenticate_with_credentials("1@1.com", @user.password)
      login1 = @user.authenticate_with_credentials(@user.email, "123456")

      expect(login).to be_falsey
      expect(login1).to be_falsey
    end
    it "logs a person in even if they're email is not case-sensitive" do
      @user = User.create(
        name: "Mike",
        email: "Mike@Ike",
        password: "123",
        password_confirmation: "123"
      )
      login = @user.authenticate_with_credentials("mike@ike", @user.password)
      expect(login).to be_truthy
    end 
  end
end
