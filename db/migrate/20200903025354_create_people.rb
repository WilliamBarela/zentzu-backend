class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.text :summary

      t.timestamps
    end
  end
end
