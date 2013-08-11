class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :post
  belongs_to :user, through: :post
  has_many :comments, as: :commentable, class_name: "Comment",
                                        foreign_key: "comment_id"

  validates :body, presence: true
  #validates_associated :user, presence: true
end
