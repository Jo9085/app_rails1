require 'faker'

City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Specialty.destroy_all


5.times do
    city = City.create(name: Faker::Address.city)
end

10.times do
    doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: ["Généraliste","Opticien","Medecin du sport","Ophtalmo"].sample, zip_code: ["75001","75002","75003","75004","75005","75006","75007","75008","75009","75010"].sample, city: City.find(rand(1..City.count)))
end

100.times do
    patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.find(rand(1..City.count)))
end

50.times do
    appointment = Appointment.create(date: Faker::Date.between(from: Date.today, to: 1.month.from_now), doctor: Doctor.find(rand(1..Doctor.count)), patient: Patient.find(rand(1..Patient.count)), city: City.find(rand(1..City.count)))
end

10.times do
    specialty = Specialty.create(name: Faker::Educator.subject)
end

20.times do
    join_table_doctor_specialty = JoinTableDoctorSpecialty.create(doctor: Doctor.find(rand(1..Doctor.count)), specialty: Specialty.find(rand(1..Specialty.count)))
end