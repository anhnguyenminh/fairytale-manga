class Comment < ApplicationRecord
  belongs_to :reader
  belongs_to :commentable, polymorphic: true
  has_many :comment, as: :commentable
  has_many :like, as: :liketable
  has_many :report 
end
