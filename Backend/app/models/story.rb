class Story < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :reader, join_table: "reader_story"
  has_one_attached :image
  # has_and_belongs_to_many :category, join_table: "category_story"
  has_many :reader_story 
  has_many :reader, :through => :reader_story
  validates :name, :author_id, presence: true
  has_many :chapter
  has_many :comment, as: :commentable
  has_many :like, as: :liketable

  def self.hot_story(time_range)
    @stories = Story.joins(:reader)
      .select("stories.*, COUNT(readers.id) as read_count")
      .group("stories.id")
      .where("stories.created_at" => time_range)
      .order("read_count DESC")
  end
end
