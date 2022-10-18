class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :chapter, :author_name, :author_id, :description, :cat_id

  def author_name
    object.author.name
  end


  def author_id
    object.author.id
  end
  
  
  has_many :category, each_serializer: CategorySerializer

  def cat_id
    object.category.ids
  end

  def status
    object.end
  end
end

