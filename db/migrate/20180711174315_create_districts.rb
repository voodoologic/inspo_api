class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.string :name
      t.references :state
      t.references :people

      t.timestamps
    end
  end
end
