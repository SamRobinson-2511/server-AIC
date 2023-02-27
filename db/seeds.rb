require 'rest-client'



#clearing database
puts 'clearing database'
# Gallery.destroy_all
Viewer.destroy_all
# Visit.destroy_all
# Art.destroy_all
puts 'database cleared'



puts 'creating viewer'
v1 = Viewer.create!(first_name: 'Sam', last_name: 'Robinson', password: '1234Test_', email: 'sam@sam.com', zip_code: '60608')
v2 = Viewer.create!(first_name: 'Tom', last_name: 'Robinson', password: '1234Test_', email: 'tom@tom.com', zip_code: '45356')
v3 = Viewer.create!(first_name: 'Weeb', last_name: 'Robinson', password: '1234Test_', email: 'weeb@weeb.com', zip_code: '60657')
v4 = Viewer.create!(first_name: 'Rem', last_name: 'Robinson', password: '1234Test_', email: 'rem@rem.com', zip_code: '60651')
v5 = Viewer.create!(first_name: 'Zeke', last_name: 'Robinson', password: '1234Test_', email: 'zeke@zeke.com', zip_code: '60647')
puts 'viewers seeded'

# puts 'creating arts'
# a1 = Art.create!(title:'monday')
# a2 = Art.create!(title:'tuesday')
# a3 = Art.create!(title:'friday')
# puts 'arts seeded'

# puts 'seeding visits'
# visit1 = Visit.create!(viewer_id: Viewer.first.id, date: 20221204, comment: 'eh', arts_id: Art.first.id)
# visit2 = Visit.create!(viewer_id: Viewer.first.id, date: 20221204, comment: 'eh', arts_id: Art.second.id)
# visit3 = Visit.create!(viewer_id: Viewer.first.id, date: 20221204, comment: 'eh', arts_id: Art.first.id)
# puts 'visits seeded'

puts 'seeding galleries'
g1 = Gallery.create!(title: 'Modern', description:'modern french art')
puts 'galleries seeded'
