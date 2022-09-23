class Organization < ApplicationRecord
  has_many :contacts
  belongs_to :accounts
end
