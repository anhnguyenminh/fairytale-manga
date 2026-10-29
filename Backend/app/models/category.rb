class Category < ApplicationRecord
  validates :name, presence: true#, message: "Category name must exist"
  validates :description, presence: true#, message: "Category description must exist"
  has_and_belongs_to_many :story, join_table: "category_story"

  # target_gender: nil => suggested to everyone, otherwise only to that group.
  GENDERS = %w[male female].freeze
  before_validation { self.target_gender = nil if target_gender.blank? }
  validates :target_gender, inclusion: { in: GENDERS }, allow_nil: true

  # Ex:- scope :active, -> {where(:active => true)}
end
