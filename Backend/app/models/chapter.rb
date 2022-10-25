class Chapter < ApplicationRecord
  validates :name, presence: true, message: "Chapter name must exist"
  belongs_to :story
  has_many_attached :images
  has_many :comment, as: :commentable
  attribute :images_url
  after_find :set_images_url
end
