class GiftSerializer < ActiveModel::Serializer
  # include JSONAPI::serializer
  attributes :name, :score, :stock, :current, :image_url #, :status

  # has_many :reader
  has_many :reader_gift, serializer: ReaderGiftSerializer
  
end
