class AdminSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :full_name, :phone, :bio, :role, :image_url
end
