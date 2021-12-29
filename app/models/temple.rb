class Temple < ApplicationRecord
  has_many :temple_history_details, dependent: :destroy
  has_many :devoters
  has_many :offline_city_centres, dependent: :destroy
  has_many :worships, dependent: :destroy
  has_one_attached :temple_image
  belongs_to :user

  def to_hash
    {
      id: self.id,
      temple_name: self.temple_name,
      description: self.description,
      temple_email: self.temple_email,
      phone_no: self.phone_no,
      temple_address: self.temple_address,
      city: self.city,
      state: self.state,
      country: self.country,
      zipcode: self.zipcode,
      start_time: self.start_time,
      end_time: self.end_time,
      user_id: self.user_id,
      logo: self.temple_logo
    }
  end

  def temple_logo
    self&.temple_image&.service_url if self.temple_image&.attached?
  end
end
