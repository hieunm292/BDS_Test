class Property < ApplicationRecord
  belongs_to :account
  scope :newest, -> { order(created_at: :desc) }
  has_one_attached :photo
  validates :name, presence: true, length: { maximum: 140 }
  validates :address, presence: true, length: { maximum: 140 }
  validates :price, presence: true, length: { maximum: 140 }
  validates :rooms, presence: true, length: { maximum: 140 }
  validates :bathrooms, presence: true, length: { maximum: 140 }
  validates :photo, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                    size:         { less_than: 5.megabytes,
                                    message: "should be less than 5MB" }

  def display_photo
    photo.variant resize_to_limit: [12500, 12500]
  end
end
