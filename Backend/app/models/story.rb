class Story < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :reader, join_table: 'reader_story'
  has_one_attached :image
  has_and_belongs_to_many :category, join_table: 'category_story'
  validates :name, :author_id , presence: true
end
