class Story < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :reader, join_table: 'readerstories'
  has_one_attached :image
  validates :name, :author_id , presence: true
end
