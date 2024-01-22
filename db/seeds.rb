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

# Sample text for larger bodies
sample_body = <<-BODY.strip_heredoc
  Hey Gorgeous Souls,

  Welcome to our little corner of positivity! In a world that often feels like a whirlwind of challenges, it's crucial to find that inner sunshine. Today, we're diving into the art of cultivating positivity, and trust me, it's a game-changer!

  1. Dance through Life:
  Let's start our journey with a little shimmy and a whole lot of groove! Turn up your favorite tunes, sway those hips, and let the music flow through your veins. Dancing isn't just for special occasions – it's your personal daily celebration. It’s not about perfect moves; it’s about the joy of movement and the freedom it brings.

  2. Bloom with Affirmations:
  Ladies, we're all about blossoming into the fabulous beings we are. Affirmations are like little love notes to yourself. Repeat them like a mantra every morning. "I am strong," "I radiate positivity," and "I am a magnet for good vibes." Your words have power, and these affirmations will set the tone for a fantastic day!

  3. Treat Yourself with Kindness:
  Picture this: a warm bubble bath, scented candles, and your favorite book. Treat yourself with the kindness you deserve. Nourish your body with wholesome food, indulge in self-care rituals, and remember, it's okay to say 'no' when you need time for yourself. You're a queen, and queens prioritize their well-being.

  4. Spread Love Like Confetti:
  Who says kindness is outdated? Sprinkle that love around like confetti, darling! Compliment a friend, smile at a stranger, or send a sweet message to someone you cherish. Acts of kindness are contagious, and you'll find the more you give, the more positive energy comes your way.

  5. Embrace Your Flaws:
  Our quirks and imperfections are what make us uniquely beautiful. Instead of focusing on what you lack, celebrate your flaws. Each scar tells a story, and every 'imperfection' adds character. You're a masterpiece in progress – a work of art, evolving and becoming more fabulous with every passing day.

  6. Surround Yourself with Sunshine Souls:
  You know those friends who light up the room with their positivity? Keep them close. Surround yourself with people who uplift you, inspire you, and make your heart sing. Positive vibes are contagious, and in the company of kindred spirits, your own light will shine even brighter.

  7. Laugh Until Your Belly Aches:
  Laughter is the best medicine, and girl, it's time for a hearty dose! Watch a funny movie, share jokes with friends, or reminisce about hilarious memories. Laughter not only boosts your mood but also connects you to the joyous rhythm of life.

  8. Find Bliss in Nature:
  Step outside and let nature be your sanctuary. Feel the grass beneath your feet, listen to the birdsong, and watch the sunset. Mother Nature has a magical way of grounding us, filling our hearts with gratitude, and reminding us of the beauty that surrounds us.

  9. Dream Big, Darling:
  What's your wildest dream? Now, multiply it by ten! Embrace your ambitions with open arms. Dreaming big fuels your spirit with passion and purpose. Don't hold back; let your aspirations soar like a butterfly in a field of wildflowers.

  10. Celebrate the Wins – Big or Small:
  Every accomplishment, no matter how small, deserves a celebration. Did you conquer a daunting task at work? Celebrate! Did you finally master that yoga pose? Celebrate! Life is a series of victories, and acknowledging them fills your journey with positivity.

  So, there you have it, lovely souls – a roadmap to infuse your life with positivity, wrapped in a bow of feminine energy and chatty vibes. Remember, being positive is not just a mindset; it's a lifestyle. Embrace the radiant you, and let your positivity sparkle like the gem that you are! 🌸💖
BODY

image1_path = Rails.root.join('app', 'assets', 'images', 'alex.jpg')

# Create some sample blog posts with attached images
15.times do |i|
  blog_post = BlogPost.create!(
    title: "Blog Post #{i + 1}",
    body: sample_body,
    published_at: Time.now - i.days
  )
  blog_post.photo.attach(io: File.open(image1_path), filename: 'alex.jpg')
end

puts 'Seed data created successfully!'
