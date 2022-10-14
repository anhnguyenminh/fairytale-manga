class GiftSerializer < ActiveModel::Serializer
  # include JSONAPI::serializer
  attributes :name, :score, :stock, :current, :image_url #, :status

  # has_many :reader
  has_many :reader_gift, serializer: ReaderGiftSerializer
  # has_many :reader, :through => :reader_gift
  # def status
  #   return object.reader_gift
  # end
  def current
    return @instance_options[:current_reader]
  end
end
