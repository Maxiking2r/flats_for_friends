# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
Flat.create(
  name: 'Lovely flat in the center',
  description: 'Centrally located beautifully furnished flat',
  location: 'Berlin',
  flat_type: 'flat',
  number_of_rooms: '2',
  price_per_month: '500',
  separation_allowed: '1',
  user: User.last,
  )
Flat.create(
  name: 'Spacious Kreuzberg room',
  description: 'Large room located perfectly to get as much sunlight as possible',
  location: 'Berlin',
  flat_type: 'room',
  number_of_rooms: '1',
  price_per_month: '300',
  separation_allowed: '2',
  user: User.last,
  )



