class Category < ApplicationRecord
  validates :name, presence: true, message: "name must exist"
  validates :description, presence: true, message: "description must exist"
  has_and_belongs_to_many :story, join_table: "category_story"

  # Ex:- scope :active, -> {where(:active => true)}
end
