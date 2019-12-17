require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
   @user = User.create!(
   name: 'Grant',
   email: '1@1.com',
   password: "123",
   password_confirmation: "123"
   )

 end
 

 scenario "person can login with correct email and password" do
 visit new_session_path
 
 fill_in "email", with: @user.email
 fill_in "password", with: @user.password

 click_button "Login"
 

 expect(page).to have_content "Signed in as #{@user.name}"

 save_screenshot


 end
 

end
