if Rails.env.development? 
  require 'faker'

  # Create Users
  5.times do
    user = User.new(
      name:     Faker::Name.name, 
      email:    Faker::Internet.email,
      password: 'helloworld'
    )
    user.skip_confirmation!
    user.save!
  end
  if User.where({email: 'admin@bloccit.com'}).count == 0
    user = User.new(
      name:     'Administrator', 
      email:    'admin@bloccit.com',
      password: 'helloworld',
      role:     'admin'
    )
    user.skip_confirmation!
    user.save!
  end
  if User.where({email: 'noel.deguzman@me.com'}).count == 0
    user = User.new(
      name:     'Noel Deguzman', 
      email:    'noel.deguzman@me.com',
      password: 'helloworld',
      role:     'premium',
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

  50.times do
    collaborator = Collaborator.new(
      wiki:  wikis.sample,
      user:  users.sample
    )
    collaborator.save!
  end

  puts "Seed finished"
  users.each do |user|
    puts "#{user.email} role: #{user.role}"
  end
  puts "#{User.count} users created"
  puts "#{Wiki.count} wikis created"
end
