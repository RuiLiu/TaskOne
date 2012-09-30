require 'spec_helper'

describe "UserPages" do
  describe "Signup page" do
    before {visit signup_path}

    it "should have title: BookMark Website signup Page"  do
      page.should have_selector("title", text:"BookMark Website signup Page")
    end

    it "should have the right h1 title" do
       page.should have_selector('h1', test:"Sign up")
    end

  end

  describe "with valid information" do

    before do
      @count = User.count
      visit signup_path
      fill_in "Name",         with: "Rui"
      fill_in "Email",        with: "ruiliu891@gmail.com"
      fill_in "Password",     with: "1234567"
      fill_in "Confirmation", with: "1234567"
      click_button "sign up"
    end

    it "should create a user" do
      User.count.should == @count+1
    end

  end

  describe "user index page" do
    before {visit users_path}
    it {page.should have_selector("h1", text:"All users")}
    it {page.should have_selector("title", text:"All users")}
  end
end
