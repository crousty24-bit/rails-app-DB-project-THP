class ChangeAgeFormatInDogs < ActiveRecord::Migration[8.0]
  def change
    change_column :dogs, :age, :string
  end
end
