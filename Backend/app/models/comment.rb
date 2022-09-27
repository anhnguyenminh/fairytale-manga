class Comment < ApplicationRecord
  validates :title, presence: true, length: {maximum:255}
  validates :reader, presence :true
end
