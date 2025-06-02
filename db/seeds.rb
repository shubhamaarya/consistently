# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

habits = [
  { name: "Morning Run", description: "Run for at least 30 minutes" },
  { name: "Read", description: "Read 20 pages of a book" },
  { name: "Meditate", description: "10 minute meditation session" }
]

habits.each do |habit_attrs|
  habit = user.habits.create!(habit_attrs)
  
  # Create some checkins
  (0..14).each do |i|
    date = i.days.ago.to_date
    habit.habit_checkins.create!(date: date) if rand > 0.3
  end
end

puts "Created test user: user@example.com / password"