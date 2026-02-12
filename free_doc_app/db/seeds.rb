require 'faker'

puts "Cleaning DB ..."
Appointment.destroy_all #destroy children bedore parents to avoid conflicts
Doctor.destroy_all
Patient.destroy_all

specialties = ["Dentist", "Surgery", "Psychiatry", "Optometry", "Ophtalmology", "Radiology", "Plastic Surgery", "Orthopedics", "Rhinology", "Hematology", "Dermatology"]

puts "------------------------"
puts "Creating 100 doctors ..."
doctors_list = []
100.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    specialty: specialties.sample,
    zip_code: Faker::Address.zip_code
  )
  doctors_list << doctor #save in array for Appointment Model
end
puts "------------------------"
puts "Creating 500 patients ..."
patients_list = []
500.times do
  patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  patients_list << patient #save in array for Appointment Model
end
puts "------------------------"
puts "Creating 1000 appointments ..."
1000.times do
  Appointment.create(
    date: Faker::Time.forward(days: 90, period: :morning, format: :long), #set random date in within max90 days
    doctor: doctors_list.sample, #arrays sample to link doctor/patient in appointment
    patient: patients_list.sample
  )
end

puts "--- Seeds done ! ---"