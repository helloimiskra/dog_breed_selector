class DogBreedSelector::Dog
  attr_accessor :size, :breed, :breed_url, :desc 
  
  @@all = []
  
  # def initialize(size = nil, breed = nil)
  #   @size = size
  #   @breed = breed
  # end
  
  def self.all_sizes
    puts <<-DOC
      1. Tiny Dog Breeds (Height: 5-12" tall | Weight: 3-10 lbs)
      2. Small Dog Breeds (Height: 12-15" tall | Weight: 10-20 lbs)
      3. Midsize Dog Breeds (Height: 15-18" tall | Weight: 20-40 lbs)
      4. Medium Size Dog Breeds (Height: 18 - 22" tall | Weight: 40-60 lbs)
      5. Large Dog Breeds (Height: 22-26" tall | Weight: 60-90 lbs)
      6. Giant Dog Breeds (Height: over 26" tall | Weight: over 100 lbs)
      DOC
   
    dog_one = self.new 
    dog_one.size = "Midsize"
    dog_one.breed = "Pembroke Welsh Corgi"
    dog_one.breed_url = "https://www.yourpurebredpuppy.com/reviews/pembrokewelshcorgis.html"
    dog_one.desc = "\n\nIf you want a dog who...\n\n- Is a 'big dog' with short legs, i.e. built long and low to the ground, but with a robust body, heavy bone, and a working dog temperament\n"
    [dog_one]
    #puts the sizes from scraper 1
  end
  
  def self.create_from_size_url(size_array)
    #grabs dog size and breed from scraper
  end
  
end