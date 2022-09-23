class Account < ApplicationRecord
  has_many :organizations
  belongs_to :owner, class_name: "User"
end
