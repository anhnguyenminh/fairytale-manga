class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :status, :chapter

  def status
    if object.end == false
      return "end"
    else
      return "on going"
    end
  end
end
