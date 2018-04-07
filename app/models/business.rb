class Business < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: {maximum: 50}
  validates :address,  presence: true, length: {maximum: 50}
  validates :city,  presence: true, length: {maximum: 50}
  validates :state,  presence: true, length: {maximum: 50}
  validates :zipcode,  presence: true, length: {maximum: 50}
  validates :phone,  presence: true, length: {maximum: 50}
  validates :description,  presence: true, length: {maximum: 500}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #validates :email, presence: true, length: {maximum: 255},
  #                  format:     { with: VALID_EMAIL_REGEX },
  #                  uniqueness: { case_sensitive: false }
  
end
