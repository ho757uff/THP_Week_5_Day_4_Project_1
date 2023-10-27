# Vider la base
DoctorSpecialty.destroy_all
Doctor.destroy_all
Patient.destroy_all
City.destroy_all
DoctorSpecialty.destroy_all

# ---

# Création de quelques spécialités
doctor_specialties = ["Cardiologist", "Dermatologist", "Pediatrician", "Rheumatologist", "Neurologist", "Oncologist", "Osteopath", "Gastroenterologist", "Naturopath", "Dentist", "Crentist"]
doctor_specialties.each do |specialty_name|
  DoctorSpecialty.create
end

# ---

# Création de quelques villes
cities = ["Paris", "Lyon", "Marseille", "Toulouse", "Nice", "Montpellier", "Cannes", "Quiberon", "Chamonix"]
cities.each do |city_name|
  City.create(name: city_name)
end

# ---

# Création des médecins
15.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: doctor_specialties.sample # Utilise une spécialité aléatoire de la liste doctor_specialties
  )
  city = City.all.sample # Sélectionne une ville aléatoire parmi celles existantes
  doctor.city = city # Associe la ville au médecin
  doctor.save
  puts
  puts "Médecin créé : #{doctor.first_name} #{doctor.last_name} - Spécialité : #{doctor.specialty} - Ville : #{city.name}"
end

# ---

# Création des patients
50.times do
  patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  city = City.all.sample # Sélectionne une ville aléatoire parmi celles existantes
  patient.city = city # Associe la ville au patient
  patient.save
  puts
  puts "Patient créé : #{patient.first_name} #{patient.last_name} - Ville : #{city.name}"
end

# ---

# Création des rendez-vous
doctors_list = Doctor.all
patients_list = Patient.all

doctors_list.each_with_index do |doctor, index|
  appointment = Appointment.create(date: DateTime.now + index.days, doctor: doctor, patient: patients_list[index])
  puts
  puts "Rendez-vous créé : Date - #{appointment.date.strftime("%d/%m/%Y %H:%M")} | Médecin - #{doctor.first_name} #{doctor.last_name} | Patient - #{patients_list[index].first_name} #{patients_list[index].last_name}"
end
