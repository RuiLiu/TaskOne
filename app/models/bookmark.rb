class Bookmark < ActiveRecord::Base
  attr_accessible :content, :comment
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 100}
  validates :comment, presence: true, length: {maximum: 200}
  default_scope order:'bookmarks.created_at DESC'
end
