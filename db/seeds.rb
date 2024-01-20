# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a default admin user
Admin.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts "admin user created"
# db/seeds.rb
puts "creating blog posts..."

# Create some sample blog posts
BlogPost.new(title: 'First Blog Post', body: 'This is the content of the first blog post.', published_at: Time.now )
BlogPost.new(title: 'Second Blog Post', body: 'Another exciting blog post with some content.', published_at: Time.now)
BlogPost.new(title: 'Third Blog Post', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', published_at: Time.now)

puts 'Seed data created successfully!'
