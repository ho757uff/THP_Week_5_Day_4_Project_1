# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ---

# Création de 5 médecins
doctors = [
  {first_name: "Léonard", last_name: "Valois", specialty: "Cardiologist", zip_code: "75001"},
  {first_name: "Mathilde", last_name: "Leroux", specialty: "Dermatologist", zip_code: "75002"},
  {first_name: "Rémi", last_name: "Fontaine", specialty: "Pediatrician", zip_code: "75003"},
  {first_name: "Clémence", last_name: "Dubois", specialty: "Rheumatologist", zip_code: "75004"},
  {first_name: "Théo", last_name: "Bernard", specialty: "Neurologist", zip_code: "75005"}
]

doctors.each do |doc|
  doctor = Doctor.create(doc)
  puts "Médecin créé : #{doctor.first_name} #{doctor.last_name} - Spécialité : #{doctor.specialty} - Code postal : #{doctor.zip_code}"
end

# Création de 5 patients
patients = [
  {first_name: "Eléonore", last_name: "Gautier"},
  {first_name: "Bastien", last_name: "Moreau"},
  {first_name: "Lucie", last_name: "Petit"},
  {first_name: "Raphaël", last_name: "Lambert"},
  {first_name: "Amandine", last_name: "Robin"}
]

patients.each do |pat|
  patient = Patient.create(pat)
  puts "Patient créé : #{patient.first_name} #{patient.last_name}"
end

# Création de quelques rendez-vous
doctors_list = Doctor.all
patients_list = Patient.all

doctors_list.each_with_index do |doctor, index|
  appointment = Appointment.create(date: DateTime.now + index.days, doctor: doctor, patient: patients_list[index])
  puts "Rendez-vous créé : Date - #{appointment.date.strftime('%d/%m/%Y %H:%M')} | Médecin - #{doctor.first_name} #{doctor.last_name} | Patient - #{patients_list[index].first_name} #{patients_list[index].last_name}"
end
