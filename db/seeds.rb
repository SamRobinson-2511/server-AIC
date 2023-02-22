puts 'clearing database...'
Review.destroy_all
Gallery.destroy_all
Visit.destroy_all
Viewer.destroy_all
Art.destroy_all
puts 'database cleared'

puts 'creating viewer'
v1 = Viewer.create!(first_name: 'Sam', last_name: 'Robinson', password: '1234', email: 'sam@sam.com', zip_code: '60608')
v2 = Viewer.create!(first_name: 'Tom', last_name: 'Robinson', password: '1234', email: 'tom@tom.com', zip_code: '45356')
v3 = Viewer.create!(first_name: 'Weeb', last_name: 'Robinson', password: '1234', email: 'weeb@weeb.com', zip_code: '60657')
v4 = Viewer.create!(first_name: 'Rem', last_name: 'Robinson', password: '1234', email: 'rem@rem.com', zip_code: '60651')
v5 = Viewer.create!(first_name: 'Zeke', last_name: 'Robinson', password: '1234', email: 'zeke@zeke.com', zip_code: '60647')
puts 'viewers seeded'

puts 'seed arts'
a1 = Art.create!(title: 'Monday')
a2 = Art.create!(title: 'Tuesday')
a3 = Art.create!(title: 'Wednesday')
puts 'arts seeded'

puts 'visits'
visit1 = Visit.create!(viewer_id: v1.id, art_id: a1.id)
visit2 = Visit.create!(viewer_id: v2.id, art_id: a2.id)
visit3 = Visit.create!(viewer_id: v3.id, art_id: a3.id)
puts 'visits seeded'

puts 'seed reviews'
r1 = Review.create!(viewer: Viewer.first, art: Art.first)
r2 = Review.create!(viewer: Viewer.third, art: Art.second)
r3 = Review.create!(viewer: Viewer.last, art: Art.third)
r4 = Review.create!(viewer: Viewer.second, art: Art.second)
puts 'reviews seeded'


puts 'seed gallery'
g1 = Gallery.create!(name: 'Modern', viewer_id: v1.id)
g2 = Gallery.create!(name: 'Ancient', viewer_id: v2.id)
g3 = Gallery.create!(name: 'Postwar', viewer_id: v3.id)
puts 'gallery seeded'
