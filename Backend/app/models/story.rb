class Story < ApplicationRecord
  validates :name, :author_id , presence: true
  belongs_to :author
end
