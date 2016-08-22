class Clinician < ApplicationRecord
  has_secure_password
  
  include PgSearch
  has_many :patients, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: {scope: :first_name}
  # validates :email, format: VALID_EMAIL_REGEX
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :address, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true


  multisearchable against: [:first_name, :last_name, :email, :phone]
end
