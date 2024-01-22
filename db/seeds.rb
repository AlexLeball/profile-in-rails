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
# db/seeds.rb

# Assuming you have image files in app/assets/images/
image1_path = Rails.root.join('app', 'assets', 'images', 'alex.jpg')
image2_path = Rails.root.join('app', 'assets', 'images', 'alex close.jpg')
image3_path = Rails.root.join('app', 'assets', 'images', 'closer.jpg')

# Create some sample blog posts with attached images
blog_post1 = BlogPost.create(
  title: 'First Blog Post',
  body: 'This is the content of the first blog post.',
  published_at: Time.now
)
blog_post1.photo.attach(io: File.open(image1_path), filename: 'alex.jpg')

blog_post2 = BlogPost.create(
  title: 'Second Blog Post',
  body: 'Another exciting blog post with some content.',
  published_at: Time.now
)
blog_post2.photo.attach(io: File.open(image2_path), filename: 'alex close.jpg')

blog_post3 = BlogPost.create(
  title: 'Third Blog Post',
  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  published_at: Time.now
)
blog_post3.photo.attach(io: File.open(image3_path), filename: 'closer.jpg')

puts 'Seed data created successfully!'

puts 'Seed data created successfully!'
