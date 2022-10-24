class Author < ApplicationRecord
  validates :name, :description, presence: true
  has_one_attached :image
  has_many :story
  has_many :comment, as: :commentable
  has_many :like, as: :liketable

  def self.has_story(author)
    return true if author.story.present? 
  end
end
