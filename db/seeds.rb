# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(full_name: 'Administrator', email: 'admin@fake.com', password: 'Please11', role: User.roles['admin'])

[ 'Amy Thorsen',
  'Yessenia Coloma',
  'Carisa Coots',
  'Bari Polinsky',
  'Cinda Emmett',
  'Almeda Tibbs',
  'Cleora Gaetano',
  'Kirsten Hamdan',
  'Markus Garvey',
  'Adela Balmer',
  'Otto Lorence',
  'Trang Allinder',
  'Bree Sick',
  'Ramonita Kaczynski',
  'Tameka Sutherlin',
  'Rosalind Brymer',
  'Kacy Mimms',
  'Osvaldo Klatt',
  'Armand Vahle',
  'Lanette Heberling'
].each do |name|
  User.create(full_name: name,
           email: "#{name.gsub(' ', '.').downcase}@patient.com",
           password: 'Please11',
           role: User.roles['patient']
          )
end

[ 'Jeramy Poisson',
  'Dominique Lazos',
  'Tobi Dubray',
  'Dolly Auvil',
  'Margery Standifer',
  'Concha Carswell',
  'Sheila Viruet',
  'Fidel Zwart',
  'Donnie Desjardin',
  'Carley Chickering',
  'Justa Phegley',
  'Benny Grady',
  'Arletta Vaughns',
  'Harris Tony',
  'Sherise Goodwill',
  'Usha Whiten',
  'Linwood Alejos',
  'Ashlea Andress',
  'Jeanne Discher',
  'Agnus Paquet'
].each do |name|
  User.create(full_name: name,
           email: "#{name.gsub(' ', '.').downcase}@doctor.com",
           password: 'Please11',
           role: User.roles['doctor']
          )
end

beginning = DateTime.now.beginning_of_day - 7.days
ending = DateTime.now.end_of_day + 7.days
date_pool = (beginning..ending).to_a


User.patient.find_each do |patient|
  next if rand(0..10).even?

  User.doctor.find_each do |doctor|
    next if rand(0..10).even?

    5.times do |i|
      start_date = date_pool.sample.change(hour: i * rand(1..5))
      end_date = start_date + 1.hour
      Appointment.create(patient: patient, doctor: doctor, start_date: start_date, end_date: end_date)
    end
  end
end
