module Stories
  class ShowStoriesSerializer < ActiveModel::Serializer
    attributes :id, :name, :status, :author_name, :description

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
      if object.end == true
        return "End"
      else
        return "On going"
      end
    end

    
  end
end

