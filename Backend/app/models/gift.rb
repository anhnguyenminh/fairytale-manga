class Gift < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :score, :stock, presence: true, numericality: { greater_than: 0 }
  has_and_belongs_to_many :reader, join_table: "readergifts"
  has_one_attached :image
  has_many :reader_gift 
  has_many :reader, :through => :reader_gift
end
