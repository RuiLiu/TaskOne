require 'spec_helper'
include SessionsHelper
describe BookmarksController do
  before do
    @user = User.new(name:"RuiLiu", email:"ruiliu@gmail.com", password:1234567, password_confirmation:1234567)
    @user.save
    sign_in @user
    @bookmark = Bookmark.new(content:"www.try.com", comment:"test")
  end

  it "should increment bookmark count" do
    expect do
      xhr :post, :create, bookmark: { content: @bookmark.content, comment:@bookmark.comment }
    end.to change(Bookmark, :count).by(1)
  end
end