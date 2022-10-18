class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :chapter, :author_name, :description, :cat_id

  def author_name
    object.author.name
  end
 
  has_many :category, each_serializer: CategorySerializer

  def cat_id
    object.category.ids
  end

  def status
    if object.end == false
      return "completed"
    else
      return "on going"
    end
  end
end
