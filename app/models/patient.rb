class Patient < ApplicationRecord
  has_secure_password
  
  include PgSearch
  belongs_to :clinician
  has_many :patient_logs, dependent: :destroy

  after_initialize :set_handler_defaults

  validates :care_id, presence: true, uniqueness: true
  validates :care_handler, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: {scope: :first_name}
  validates :sex, presence: true
  validates :age, presence: true
  # validates :email, presence: true, uniquness: true, format: VALID_EMAIL_REGEX
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :clinician_id, presence: true
  validates :fam_doc_id, presence: true

  multisearchable against: [:care_id, :care_handler, :first_name, :last_name, :email, :phone]

  private

  def set_handler_defaults
    self.care_handler ||= 'Not Required'
  end
end
