class Student < ApplicationRecord

  has_secure_password

  validates :name,:address, :phone_number, presence: true
  # validates :email, confirmation: true,format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :email_confirmation, presence: true,format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true


  has_many :responses
  has_many :questions, through: :responses

  
  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "id", "name", "password_digest", "phone_number", "updated_at"]
  end
end
