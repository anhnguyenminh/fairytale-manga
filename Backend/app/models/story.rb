class Story < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :category, join_table: 'category_story'
  has_one_attached :image
  # has_and_belongs_to_many :category, join_table: "category_story"
  has_many :reader_story
  has_many :reader, through: :reader_story
  validates :name, presence: true
  validates :author_id, presence: true
  # validates :categories_id, presence: true
  has_many :chapter
  has_many :comment, as: :commentable
  has_many :like, as: :liketable
  attribute :image_url
  after_find :set_image_url


  def self.hot_story(time_range)
    ids = ReaderStory.where(created_at: time_range)
                     .group(:story_id)
                     .order(Arel.sql("COUNT(*) DESC"))
                     .limit(5)
                     .pluck(:story_id)
    where(id: ids)
  end
end
