class Reader::StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :author_name, :description, :image_url, :views

  def author_name
    object.author.name
  end

  def author_id
    object.author.id
  end

  has_many :category, each_serializer: CategorySerializer
  has_many :chapter, each_serializer: ChapterSerializer
  
  def status
    if object.end == 0
      return "On going"
    else
      return "End"
    end
  end

  def views
    object.reader.length
  end
end

