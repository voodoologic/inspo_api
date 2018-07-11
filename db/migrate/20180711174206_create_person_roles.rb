class CreatePersonRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :person_roles do |t|
      t.references :person
      t.references :role

      t.timestamps
    end
  end
end
