require 'spec_helper'

describe "Bookmark" do
  before do
    @user = User.new(name:"Rui", email:"rui@facebook.com", password:1234567,password_confirmation:1234567)
    @user.save
    @bookmark = @user.bookmarks.build(content: "www.cmu.edu", comment:"school")
  end

  describe "valid bookmark" do
    it{@bookmark.should be_valid}
  end

   it "bookmark need to have content" do
     @bookmark.content = ''
     @bookmark.should_not be_valid
   end

  it "bookmark need to have comment" do
    @bookmark.comment = ""
    @bookmark.should_not be_valid
  end

  it "bookmark need to have user_id" do
    @bookmark.user_id = nil
    @bookmark.should_not be_valid
  end

end
