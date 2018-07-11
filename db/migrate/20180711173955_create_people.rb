class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :social_security
      t.string :email
      t.references :district

      t.timestamps
    end
  end
end
