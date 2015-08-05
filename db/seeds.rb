if Rails.env.development? 
  require 'faker'

  # Create Users
  5.times do
    user = User.new(
      name:     Faker::Name.name, 
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10),
    )
    user.skip_confirmation!
    user.save!
  end
  if User.where({email: 'noel@bloccit.com'}).count == 0
    user = User.new(
      name:     'Noel Deguzman', 
      email:    'noel.deguzman@me.com',
      password: 'helloworld'
    )
    user.skip_confirmation!
    user.save!
  end
  users = User.all

  25.times do
    wiki = Wiki.new(
      title: Faker::Lorem.sentence,
      body:  Faker::Lorem.paragraph,
      user:  users.sample
    )
    wiki.save!
  end
  wikis = Wiki.all

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Wiki.count} wikis created"
end
