class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :end, :chapter
end
