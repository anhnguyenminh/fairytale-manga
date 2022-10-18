class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :chapter, :author_name

  def author_name
    object.author.name
  end
 
  has_many :category, each_serializer: CategorySerializer

  def status
    if object.end == false
      return "completed"
    else
      return "on going"
    end
  end
end
