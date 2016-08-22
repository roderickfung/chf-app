class CreatePatientLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_logs do |t|
      t.date :date
      t.integer :heartrate
      t.integer :bp_hi
      t.integer :bp_low
      t.integer :weight
      t.string :exerting_breath
      t.string :night_breath
      t.string :leg_swollen
      t.string :lightheadedness
      t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end
