class Gift < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255, message: "name is too long(maximum is 255 characters"}
  validates :score, presence: true, numericality: { greater_than: 0, message: "score must more than 0" }
  validates :stock, presence: true, numericality: { greater_than: 0, message: "stock must more than 0" }
  attribute :image_url
  after_find :set_image_url
  has_one_attached :image
  has_many :reader_gift
  has_many :reader, :through => :reader_gift
end
