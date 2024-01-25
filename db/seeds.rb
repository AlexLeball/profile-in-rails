# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Admin.destroy_all
BlogPost.destroy_all

puts "Creating admin user..."
Admin.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts "Admin user created"
puts "Creating blog posts..."
# Assuming you have a 'BlogPost' model with 'title', 'body', 'published_at', and 'photo' attributes

# Sample text for the blog post body
sample_body = <<-BODY.strip_heredoc
  Hey Beautiful Souls,

  Welcome to our cozy corner of positivity! Today, we're delving into the art of embracing joy and creating a life filled with positivity. Let's embark on this journey together!

  1. Dance into Joy:
  Begin your day with a dance, letting the rhythm of joy flow through you. It's not about perfect moves; it's about the happiness dancing brings. Turn on your favorite music, sway to the beat, and celebrate the joy of being alive.

  2. Blossom with Positivity:
  Nurture yourself with positive affirmations. Repeat phrases like "I radiate positivity," "I am worthy of joy," and "My spirit is a beacon of light." These affirmations will uplift your spirits and set the tone for a fantastic day.

  3. Self-Love Rituals:
  Treat yourself with kindness. Take a luxurious bath, savor your favorite tea, and indulge in a good book. Remember, self-love is not a luxury; it's a necessity. Prioritize your well-being, and let kindness be your daily companion.

  4. Sprinkle Kindness:
  Spread kindness like confetti. Compliment a friend, share a smile with a stranger, or send a heartfelt message to someone special. Acts of kindness create a ripple effect, bringing more positivity into your life.

  5. Embrace Your Uniqueness:
  Celebrate your quirks and imperfections. Your uniqueness is your strength. Each scar tells a story, and every flaw adds character. You are a masterpiece in progress, evolving into a more incredible version of yourself each day.

  6. Surround Yourself with Sunshine:
  Keep company with those who radiate positivity. Surround yourself with friends who inspire and uplift you. Positive energy is contagious, and in the presence of kindred spirits, your light will shine even brighter.

  7. Laughter Therapy:
  Laugh until your belly aches. Watch a funny movie, share jokes with friends, and relish in the joy of laughter. Laughter is a powerful tonic that connects you to the vibrant rhythm of life.

  8. Nature's Bliss:
  Step outside and connect with nature. Feel the earth beneath your feet, listen to the birdsong, and witness the beauty of a sunset. Nature has a way of grounding us and filling our hearts with gratitude.

  9. Dream Big:
  Dare to dream big. Your ambitions are the wings that will carry you to new heights. Embrace your dreams with passion and let them guide you on a journey of fulfillment.

  10. Celebrate Victories:
  Acknowledge and celebrate every victory, big or small. Whether you conquered a challenge at work or achieved a personal milestone, each success adds brightness to your journey.

  So here's to you, radiant souls – a guide to infuse your life with positivity. Let your joy shine bright, and may your days be filled with love, laughter, and endless positivity! 🌈💖
BODY

# Assuming you have an image named 'alex.jpg' in the 'app/assets/images' directory
image1_path = Rails.root.join('app', 'assets', 'images', 'alex.jpg')

# Create a sample blog post with attached image
blog_post = BlogPost.create!(
  title: 'Embracing Positivity',
  body: sample_body,
  published_at: Time.now,
)
blog_post.photo.attach(io: File.open(image1_path), filename: 'alex.jpg')

puts 'Sample blog post created successfully.'


puts 'Seed data created successfully!'
