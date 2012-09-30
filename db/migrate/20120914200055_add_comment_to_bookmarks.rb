class AddCommentToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :comment, :string
  end
end
