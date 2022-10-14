class Notification < ApplicationRecord
  belongs_to :reader

  def self.create(title, id)
    @notification =  Notification.create(title: title, reader_id: id)
  end
end
