require 'faker'

# User.destroy.all
# Event.destroy.all
# Attendance.destroy.all

def create_user
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@yopmail.com"
  User.create(first_name: first_name, last_name: last_name, description: Faker::Quotes::Shakespeare.hamlet_quote, email: email, encrypted_password: SecureRandom.urlsafe_base64)
end

def new_event
  Event.new(start_date: Faker::Date.forward(days: 365), duration: rand([5,10,15,20,25,30,35,40,45,50,55,60]), title: Faker::Movie.title, description: Faker::Movie.quote, price: rand(1..1000), location: Faker::Address.city)
end

def new_attendance
  Attendance.new(stripe_customer_id: SecureRandom.urlsafe_base64)
end

def generate_database
  10.times do 
    user = create_user
    event = new_event
    event.administrator_id = User.id
    event.create
  end
  20.times do
    attendance = new_attendance
    attendance.user = User.all.sample
    attendance.event = Event.all.sample
    attendance.create
  end
  puts "database completed!"
end

puts "test"