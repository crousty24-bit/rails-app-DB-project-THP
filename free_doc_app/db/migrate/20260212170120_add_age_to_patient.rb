class AddAgeToPatient < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :age, :string
  end
end
