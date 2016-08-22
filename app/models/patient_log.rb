class PatientLog < ApplicationRecord
  belongs_to :patient
  has_many :data_apis, dependent: :destroy

  validates :patient_id, presence: true
  validates :date, presence: true
  validates :heartrate, presence: true
  validates :bp_hi, presence: true
  validates :bp_low, presence: true
  validates :weight, presence: true
  validates :exerting_breath, presence: true
  validates :night_breath, presence: true
  validates :leg_swollen, presence: true
  validates :lightheadedness, presence: true

end
