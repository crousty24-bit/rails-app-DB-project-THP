class RemoveSpecialtyFromDoctors < ActiveRecord::Migration[8.0]
  def change
    remove_column :doctors, :specialty, :string
  end
end
