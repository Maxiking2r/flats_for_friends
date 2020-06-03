require "date"
puts 'Cleaning the database'
Booking.delete_all
Flat.delete_all
User.delete_all

puts 'Creating fake user data...'

User.create(
  first_name: 'Peter',
  last_name: 'Parker',
  email: 'friendlyneighborhoodspider@web.com',
  password: '123456'
  )

User.create(
  first_name: 'Frederike',
  last_name: 'Soyka',
  email: 'frederikesoyka@web.com',
  password: '123456'
  )

User.create(
  first_name: 'Max',
  last_name: 'Zweyer',
  email: 'maxzweyer@web.com',
  password: '123456'
  )

User.create(
  first_name: 'Nain',
  last_name: 'Mohd',
  email: 'nainmohd@web.com',
  password: '123456'
  )

flat1 =Flat.create(
  name: 'Lovely flat in the center',
  description: 'Centrally located beautifully furnished flat',
  location: 'Berlin',
  flat_type: 'flat',
  number_of_rooms: 2,
  price_per_month: 500,
  separation_allowed: 1,
  user: User.last,
  )

flat2 = Flat.create(
  name: 'Spacious Kreuzberg room',
  description: 'Large room located perfectly to get as much sunlight as possible',
  location: 'Berlin',
  flat_type: 'room',
  number_of_rooms: 1,
  price_per_month: 300,
  separation_allowed: 2,
  user: User.last,
  )

users = User.all

Booking.create!(
  start_date: Date.new(2020,7,1),
  end_date: Date.new(2020,7,15),
  user: users.sample,
  flat: flat1
  )

Booking.create!(
  start_date: Date.new(2020,8,1),
  end_date: Date.new(2020,8,15),
  user: users.sample,
  flat: flat2
  )

Booking.create!(
  start_date: Date.new(2020,9,1),
  end_date: Date.new(2020,9,15),
  user: users.sample,
  flat: flat2
  )

