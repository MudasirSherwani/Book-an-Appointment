# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    user1 = User.create!(name: "mudasir", password: "123456", email: "mudasir@gamil.com", gender: "male", age:30)
    doctor1 = Doctor.create!(name: "Dr. Abdul Saboor", city: "Kabul", description: "RBSP", speciality: "Dentist", image: "\images\doctors\doctor-1.jpg")
    Appointment.create!(disease: "abc", city: "Kabul", appointment_date: "2021-10-10", appointment_time: "10:00", user_id: user1.id, doctor_id: doctor1.id)