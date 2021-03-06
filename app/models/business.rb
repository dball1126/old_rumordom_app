class Business < ApplicationRecord
  require 'csv'
  before_save { self.email = email.downcase }
  
 
      has_many :passive_relationshipzs, class_name:  "Relationshipz",
                                    foreign_key: "followedz_id",
                                    dependent:   :destroy
  has_many :followerzs, through: :passive_relationshipzs, source: :followerz                            
  has_many :experiences, dependent: :destroy
  has_many :followingz, through: :active_relationshipzs, source: :followedz
  #validates :name,  presence: true, length: {maximum: 50}
  #validates :address,  presence: true, length: {maximum: 50}
  #validates :city,  presence: true, length: {maximum: 50}
  #validates :state,  presence: true, length: {maximum: 50}
  #validates :zipcode,  presence: true, length: {maximum: 50}
  #validates :phone,  presence: true, length: {maximum: 50}
  #validates :description,  presence: true, length: {maximum: 500}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #validates :email, presence: true, length: {maximum: 255},
  #                  format:     { with: VALID_EMAIL_REGEX },
  #                  uniqueness: { case_sensitive: false }
  
  def self.import(file)
    CSV.foreach( "file.csv", "r:windows-1250" ) do |row|
      Business.create! row.to_hash
    end
  end
  
end
