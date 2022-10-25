class Mission < ApplicationRecord
  has_many :mission_reader
  has_many :reader, :through => :mission_reader
  validates :name, presence: true, message: "Mission name must exist"
  validates :score, numericality: { greater_than: 0, message: "Mission score must more than 0" }
end
