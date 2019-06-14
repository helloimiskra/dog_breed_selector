class DogBreedSelector::Dog
  attr_accessor :size, :breed, :breed_url, :desc 
  
  @@all = []
  
  def initialize(size = nil, breed = nil)
    @size = size
    @breed = breed
  end
  
  def self.all_sizes
    puts <<-DOC
      1. Tiny Dog Breeds (Height: 5-12" tall | Weight: 3-10 lbs)
      2. Small Dog Breeds (Height: 12-15" tall | Weight: 10-20 lbs)
      3. Midsize Dog Breeds (Height: 15-18" tall | Weight: 20-40 lbs)
      4. Medium Size Dog Breeds (Height: 18 - 22" tall | Weight: 40-60 lbs)
      5. Large Dog Breeds (Height: 22-26" tall | Weight: 60-90 lbs)
      6. Giant Dog Breeds (Height: over 26" tall | Weight: over 100 lbs)
      DOC
      
      dog = self.new 
      dog.size = "Midsize"
      dog.breed = "Pembroke Welsh Corgi"
      dog.breed_url = "https://www.yourpurebredpuppy.com/reviews/pembrokewelshcorgis.html"
      dog.desc = 
     <<-DOC
      If you want a dog who...

    - Is a "big dog" with short legs, i.e. built long and low to the ground, but with a robust body, heavy bone, and a working dog temperament
    - Is spirited and athletic, but needs only moderate exercise to maintain his muscle tone
    - Has a short easy-care coat in a variety of colors
    - Is polite with guests and makes a sensible watchdog
    - Is usually fine with other family pets, and especially good with livestock 
    
     A Pembroke Welsh Corgi may be right for you.
    
    If you don't want to deal with...

    - Providing enough mental stimulation that gives him something productive to do
    - Destructiveness when bored or left alone too much
    - Territorial aggression toward dogs and cats he doesn't know
    - Strong-willed mind of his own, requiring a confident owner who can take charge
    - Chasing and nipping at things that move
    - Lots of barking
    - Heavy shedding
    
      A Pembroke Welsh Corgi may not be right for you.
      
    DOC

    #puts the sizes from scraper 1
  end
  
  def self.create_from_size_url(size_array)
    #grabs dog size and breed from scraper
  end
  
end