class Event < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :temple
  has_one_attached :event_image

  def to_hash
    { 
      event_name: self.event_name,
      event_description: self.event_description,
      event_date: self.event_date,
      event_time: self.event_time,
      event_address: self.event_address,
      temple_id: self.temple_id,
      event_photo: self.event_image_url
    }
  end

  def event_image_url
    url_for(self.event_image) if self.event_image&.attached?
  end
end
