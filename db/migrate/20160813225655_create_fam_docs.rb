class CreateFamDocs < ActiveRecord::Migration[5.0]
  def change
    create_table :fam_docs do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :phone, limit: 20
      t.timestamps
    end
  end
end
