class Chapter < ApplicationRecord
  validates :name, :story, presence :true
  belongs_to :story
  has_many_attached :images
end
