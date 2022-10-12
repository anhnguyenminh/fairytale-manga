class Mission < ApplicationRecord
  has_many :mission_reader
  has_many :reader, :through => :mission_reader
  validates :name, presence: true
  validates :score, numericality: { only_integer: true, greater_than: 0 }
end
