class ChapterSerializer < ActiveModel::Serializer
  attributes :name, :images_url
  # belongs_to :story
end
