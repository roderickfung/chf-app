class CreateClinicians < ActiveRecord::Migration[5.0]
  def change
    create_table :clinicians do |t|
      # t.string :filename
      # t.string :content_type
      # t.binary :file_contents
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :password
      t.string :password_confirmation
      t.timestamps
    end
  end
end
