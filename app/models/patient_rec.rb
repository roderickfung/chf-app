class PatientRec < ApplicationRecord
  validates :visit_date, presence: true
  validates :diagnoses, presence: true
  validates :diag_date, presence: true
  validates :new_prescription, presence: true
  validates :prescribed_date, presence: true
  validates :new_prescription_end, presence: true
  validates :clinician_id, presence: true
  validates :patient_id, presence: true
end
