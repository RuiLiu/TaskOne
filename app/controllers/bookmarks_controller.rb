class BookmarksController < ApplicationController
  before_filter :signed_in_user, only:[:create, :destroy]

  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    @user = current_user
    @feed_items = current_user.feed.paginate(page: params[:page])
    if @bookmark.save
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    else
      render "/users/show"
    end
  end

  def destroy
      @bookmark = current_user.bookmarks.find(params[:bookmark_id])
      @bookmark.destroy
      redirect_to current_user
  end
end