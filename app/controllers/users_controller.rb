class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks.paginate(page:params[:page])
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    @feed_items = @user.feed.paginate(page: params[:page])
    @id = 0
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
end
