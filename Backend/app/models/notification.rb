class Notification < ApplicationRecord
  belongs_to :reader

  def self.create(title, reader_id)
    @notification =  Notification.create(title: title, reader_id: reader_id)
  end
end
