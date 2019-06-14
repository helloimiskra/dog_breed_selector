class DogBreedSelector::Scraper
  
  def self.all_sizes
    puts <<-DOC
      1. Tiny Dog Breeds (Height: 5-12" tall | Weight: 3-10 lbs)
      2. Small Dog Breeds (Height: 12-15" tall | Weight: 10-20 lbs)
      3. Midsize Dog Breeds (Height: 15-18" tall | Weight: 20-40 lbs)
      4. Medium Size Dog Breeds (Height: 18 - 22" tall | Weight: 40-60 lbs)
      5. Large Dog Breeds (Height: 22-26" tall | Weight: 60-90 lbs)
      6. Giant Dog Breeds (Height: over 26" tall | Weight: over 100 lbs)
      DOC
    doc = Nokogiri::HTML(open("https://www.yourpurebredpuppy.com/dogbreeds/"))
    binding.pry 
    
    # dogs = self.scrape_from_main
    # dogs.map do |dog|
    #   dog = Dog.new(school)
    # end 
  end
  
  def self.scrape_from_main
   doc = Nokogiri::HTML(open("https://www.yourpurebredpuppy.com/dogbreeds/"))
    binding.pry 
    #grabs urls from main page to go to each size
  end
  
  
  def scrape_from_size(size_url)
    #grabs breed name and url from size url page to dog's description
  end
  
  def scrape_from_profile(breed_url)
    #grabs name and list (good & bad) from page
  end
  
end
