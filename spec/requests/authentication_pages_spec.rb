require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }
  describe "signin_page" do
     before{visit signin_path}
    it {page.should have_selector("h1",text:"Sign in")}
    it {page.should have_selector("title", text:"Signin")}
  end

  describe "valid user" do
    before do
      @user = User.new(name:"Rui",email:"rui@gmail.com",password:1234567,password_confirmation:1234567)
      @user.save
      visit signin_path
      fill_in "Email",    with: @user.email
      fill_in "Password", with: @user.password
      click_button "Sign in"
    end
    it {should have_selector("h1", text:"Rui")}
    it {should have_link('Sign out', href: signout_path)}
    it {should have_link('All users', href:users_path)}
  end
end
