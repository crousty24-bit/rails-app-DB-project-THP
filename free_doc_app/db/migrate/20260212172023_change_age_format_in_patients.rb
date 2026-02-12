class ChangeAgeFormatInPatients < ActiveRecord::Migration[8.0]
  def change
    change_column :patients, :age, :integer
  end
end
