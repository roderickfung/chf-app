class CreatePatientRecs < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_recs do |t|
      t.date :visit_date
      t.text :diagnoses
      t.date :diag_date
      t.text :diag_description
      t.text :current_prescription
      t.text :new_prescription
      t.date :prescribed_date
      t.date :new_prescription_end

      t.references :clinician, foreign_key: true
      t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end
