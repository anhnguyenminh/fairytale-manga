class Mission < ApplicationRecord
  validates :name, presence :
  validates :score, numericality: { only_integer: true , greater_than: 0}
end
