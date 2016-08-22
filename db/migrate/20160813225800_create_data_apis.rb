class CreateDataApis < ActiveRecord::Migration[5.0]
  def change
    create_table :data_apis do |t|
      t.text :fb_data_full
      t.references :patient_log, foreign_key: true
      t.timestamps
    end
  end
end
