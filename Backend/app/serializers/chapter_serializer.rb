class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :name, :images_url
  # belongs_to :story
end
