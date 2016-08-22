class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      # t.string :filename
      # t.string :content_type
      # t.binary :file_contents
      t.integer :care_id, limit: 8
      t.string :care_handler
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.integer :age
      t.string :email
      t.string :phone, limit: 20
      t.string :address
      t.string :password
      t.string :password_confirmation
      t.references :clinician, foreign_key: true
      t.references :fam_doc, foreign_key: true
      t.timestamps
    end
  end
end
