class GiftSerializer < ActiveModel::Serializer
  attributes :name, :score, :stock#, :status

  # has_many :reader
  # has_many :reader_gift, serializer: ReaderGiftSerializer
  # has_many :reader, :through => :reader_gift
  # def status
  #   return object.reader_gift
  # end
  
end
