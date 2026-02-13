require 'faker'
require 'colorize'

puts "Cleaning DB ...".colorize(:blue)
Appointment.destroy_all #destroy children(join tables) before parents to avoid conflicts
JoinTableDoctorSpecialty.destroy_all
Doctor.destroy_all
Patient.destroy_all
Specialty.destroy_all
City.destroy_all

puts "------------------------"
puts "Creating Cities...".colorize(:light_blue)
cities_list = []
10.times do
  city = City.create(name: Faker::Address.city)
  cities_list << city
end
puts "Cities created: #{City.count}".colorize(:light_green)

puts "------------------------"
puts "Creating Specialties...".colorize(:light_blue)
specialties_list = ["Dentist", "Surgery", "Psychiatry", "Optometry", "Ophtalmology", "Radiology", "Plastic Surgery", "Orthopedics", "Rhinology", "Hematology", "Dermatology"]
specialties = []
specialties_list.each do |spec_name|
  specialty = Specialty.create(name: spec_name)
  specialties << specialty
end
puts "Specialties created : #{Specialty.count}".colorize(:light_green)

puts "------------------------"
puts "Creating 100 doctors ...".colorize(:light_blue)
doctors_list = []
100.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city: cities_list.sample
  )
  doctors_list << doctor #save in array for Appointment Model

  number_of_specs = rand(1..3) #assign 1 to 3 random specs from array sample
  random_specs = specialties.sample(number_of_specs)
  random_specs.each do |spec|
    JoinTableDoctorSpecialty.create( #assign specialty from join table
      doctor: doctor, 
      specialty: spec
    )
  end
end
puts "Doctors created : #{Doctor.count}".colorize(:light_green)

puts "------------------------"
puts "Creating 500 patients ...".colorize(:light_blue)
patients_list = []
500.times do
  patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(from: 1, to: 99),
    gender: Faker::Gender.short_binary_type,
    city: cities_list.sample
  )
  patients_list << patient #save in array for Appointment Model
end
puts "Patients created : #{Patient.count}".colorize(:light_green)

puts "------------------------"
puts "Creating 1000 appointments ...".colorize(:light_blue)
1000.times do
  Appointment.create(
    date: Faker::Time.forward(days: 90, period: :morning, format: :long), #set random date in within max90 days
    doctor: doctors_list.sample, #arrays sample to link doctor/patient in appointment
    patient: patients_list.sample,
    city: cities_list.sample
  )
end
puts "Appoinments created: #{Appointment.count}".colorize(:light_green)
puts "------------------------"
puts "--- Seeds done ! ---".colorize(:light_green)