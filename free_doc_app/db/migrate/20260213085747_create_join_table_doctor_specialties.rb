class CreateJoinTableDoctorSpecialties < ActiveRecord::Migration[8.0]
  def change
    create_table :join_table_doctor_specialties do |t|
      t.belongs_to :doctor, null: false, foreign_key: true
      t.belongs_to :specialty, null: false, foreign_key: true
      t.timestamps
    end
  end
end
