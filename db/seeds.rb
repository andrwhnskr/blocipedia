require 'faker'

Wiki.destroy_all

# Create Wikis
50.times do 
  Wiki.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph,
    )
end
wikis = Wiki.all
wikis.each do |w|
  w.update_attribute(:private, false)
end


puts "Seed Finished: #{Wiki.count} wikis created"