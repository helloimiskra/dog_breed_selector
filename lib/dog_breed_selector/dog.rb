require_relative './scraper.rb'
class DogBreedSelector::Dog
  attr_accessor :size, :breed, :breed_url, :desc, :breed_size

  @@all = []

  def initialize(breed_size = nil, breed = nil, breed_url = nil, desc = nil)
    @breed, @breed_url, @breed_size, @desc = breed, breed_url, breed_size, desc
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_sizes
    @@all.map do |dog|
      dog.breed_size
    end
  end

  def self.load_sizes
    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"
    size_urls = DogBreedSelector::Scraper.scrape_from_main(main_url)
    dog_sizes = DogBreedSelector::Scraper.scrape_from_size(size_urls)
    dog_sizes
  end

  def self.desc_by_breed(size_input, breed_input)
    @@all.map{|dog| dog.desc}[size_input][breed_input]
  end

  def self.delete_all
    @@all.clear
  end

end
