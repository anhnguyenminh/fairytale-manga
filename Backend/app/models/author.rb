class Author < ApplicationRecord
  validates :name, :description, presence: true
  has_one_attached :image
  has_many :story
  has_many: :comment as: :commentable
end
