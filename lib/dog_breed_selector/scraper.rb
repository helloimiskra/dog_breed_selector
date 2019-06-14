class DogBreedSelector::Scraper
  
  
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
