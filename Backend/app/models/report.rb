class Report < ApplicationRecord
  has_and_belongs_to_many :reader, join_table: "reader_report"
  belongs_to :comment
  validates :reader_id, :comment_id, presence :true
  validates :num_report, numericality: {greater_than: 0}
end
