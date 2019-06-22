
require_relative './dog.rb'
require_relative './scraper.rb'

class DogBreedSelector::CLI
  attr_accessor :dog_sizes, :dog_breeds, :size_urls, :breed_size, :dogs, :breed_names

  def call
    self.greeting
    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"
    @size_urls = DogBreedSelector::Scraper.scrape_size_urls(main_url)
    @dog_sizes = DogBreedSelector::Scraper.scrape_size_names(size_urls)
    loop do
      user_input = main_menu
        if user_input.include?("x")
          goodbye
          return
        else
        self.list_dog_sizes
	      self.choose_dog_size
        self.choose_dog_breed
      end
    end
  end

  def main_menu
    puts "Type any key to continue, or 'x' to exit."
    input = gets.strip.downcase
    return input
  end

  def list_dog_sizes
    @dog_sizes.map.with_index(1) do |size, i|
      puts "#{i}. #{size}"
    end
  end

  def choose_dog_size
    puts "Enter the number of the dog breed size you prefer below or type 'x' to exit."
    @input_one = gets.strip.to_i-1
    @size = @dog_sizes[@input_one]
    self.list_all_breeds(@size_urls, @size)
  end

  def list_all_breeds(size_urls, size)
    @breed_names = DogBreedSelector::Scraper.scrape_breed_names(size_urls, size)
    @breed_names.map.with_index(1) do |breed, i|
      puts "#{i}. #{breed}"
    end
  end

  def choose_dog_breed
	   puts "Choose the number of the breed you're interested in, or type 'x' to exit."
     @input_two = gets.strip.to_i-1
     @breed = @breed_names[@input_two]
     list = list_qualities(@breed_url, @breed_names, @breed).map{|list| puts "\nIf you'd like a dog who ... #{list}"}
     if list == []
       puts "There is no available information for this breed at the moment. Please try another."
     else
       list
     end
   end
   #
   #
  #    each {|desc| puts "\nIf you'd like a dog who ... #{desc}\n"}
  #    if list == []
  #      puts "There is no available information for this breed at the moment. Please try another."
  #    else
  #      list
  #    end
  #  end

   #breed.rb one object per breed (@name, @size, @desc (string), @url)
   #

   def list_qualities(breed_url, breed_names, breed)
     DogBreedSelector::Scraper.scrape_from_breed_url(breed_url, breed_names, breed)
   end

   def greeting
    puts "\n\nWoof! Woof!\n\nU ´ᴥ` U\n\n"
    # sleep(5)
    puts "Looking to adopt a new furry member of the family?\n\nUncertain of which dog breed is best for you and your family?\n\nYou've come to the right place!\n\n"
    # sleep(5)
    puts "With 180 dog breeds to choose from, the Dog Breed Selector will help you make the right choice!\n\nPlease wait a few minutes for the application to load."
  end

  def goodbye
    puts "Enjoy the new member of your family!"
  end

end
