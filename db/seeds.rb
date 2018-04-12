User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobared",
             password_confirmation: "foobared",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


Business.create!(name:  "Example Business",
             city:  "Brooklyn",
             state: "NY",
             zipcode: "11243",
             address: "900 7th Ave",
             phone: "7828899485",
             email: "example@railstutorial1.org",
             description: "We do Burgers and Fries")

50.times do |nn|
  name     = Faker::Name.name
  city     = Faker::Address.city
  state    = Faker::Address.state
  zipcode  = Faker::Address.zip_code
  address = Faker::Address.street_name
  phone    = Faker::PhoneNumber.phone_number
  email    = "example-#{nn+1}@railstutorial2.org"
  description = Faker::Company.catch_phrase
  
  
  Business.create!(name:        name,
                   city:        city,
                   state:       state,
                   zipcode:     zipcode,
                   address:    address,
                   phone:       phone,
                   email:       email,
                   description: description)
end