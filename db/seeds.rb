# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Carreras = ["Ingeniería Sistemas y Computación", "Ingeniería eléctrica", "Ingeniería mecánica", "Medicina", 
                "Artes plásticas", "Música", "Agronomía", "Derecho", "Ciencias económicas", "Biología"]

99.times do
    student = Student.new
    
    name = Faker::Name.first_name
    lastname = Faker::Name.last_name

    student.assign_attributes({ 
        :name => name,
        :lastname => lastname,
        :email => name.downcase + '' + lastname.downcase + '@unal.edu.co', 
        :career => Carreras.sample,
        :age => rand(15..30),
        :PAPA =>  rand * (5 - 3) + 3
    })
    student.save!
end
