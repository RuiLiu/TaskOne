require 'spec_helper'

describe "HomePages" do
  before {visit root_path}
  it "should have the right title" do
    page.should have_selector('title',:text => "BookMark Website Homepage")
  end

  it "should have the h1 'BookMark Website'" do
    page.should have_selector('h1', :text => 'BookMark Website')
  end

  it "shoule have the righ h2" do
    page.should have_selector("h2", test:"This is the home page for the bookmark sharing ")
  end
end
