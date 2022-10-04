class Chapter < ApplicationRecord
  # validates :name, :story_id, presence :true
  belongs_to :story
  has_many_attached :images
  has_many :comment, as: :commentable
end
