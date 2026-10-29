class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :target_gender
end
