class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :business
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates  :user_id, presence: true
  validates  :business_id, presence: true
end
