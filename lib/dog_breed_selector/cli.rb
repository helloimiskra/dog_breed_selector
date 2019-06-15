
require_relative './dog.rb'
require_relative './scraper.rb'

class DogBreedSelector::CLI
  attr_accessor :dog_sizes, :breed, :desc, :dog_breeds, :size_urls, :breed_size, :breed_url


  def call
    greeting
    list_dog_sizes
    menu
    # goodbye
  end

  def greeting
    puts "\n\nWoof! Woof!\n\nU ´ᴥ` U\n\nLooking to adopt a new furry member of the family?\n\nUncertain of which dog breed is best for you and your family?\n\nYou've come to the right place!\n\nSelect a size below:\n\n"
  end


  def list_dog_sizes
    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"
    @size_urls = DogBreedSelector::Scraper.scrape_from_main(main_url)
    @dog_sizes = DogBreedSelector::Scraper.scrape_from_size(@size_urls)
    @dog_sizes.map!.with_index(1) do |dog, i|
      dog.each do |d|
        puts "#{i}. #{d.breed_size}"
      end
    end
  end

  def list_dog_breeds(size)
    @dog_breeds = DogBreedSelector::Dog.all_breeds_by_size(size)
  end

  def list_qualities(breed)
    @descriptions = DogBreedSelector::Scraper.scrape_from_profile

    DogBreedSelector::Dog.all_desc_by_breed(breed)
  end

  def menu
    input = nil
    puts "Enter the number of the dog breed size you prefer below or type 'exit'"
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 7
        breed_size = @dog_sizes[input.to_i-1].map{|i| i.breed_size}.join
        list_dog_breeds(breed_size).each.with_index(1) do |breed_size, i|
          puts "#{i}. #{breed_size}"
        end
        puts "Choose the number of the breed you're interested in, or type 'list' to go back to the dog breed sizes."
        binding.pry



        #   input1 = gets.strip.downcase
        #   if input.to_i > 0 && input.to_i < list_dog_breeds(breed_size).length
        #     breed = @dog_breeds[input.to_i-1]
        #     binding.pry
        #   end
        # end


      elsif input === "list"
        list_dog_sizes
      elsif input === "exit"
        goodbye
      else
        "Not sure which breed you want? Type 'list' or 'exit' to continue."
      end
    end
  end

  def goodbye
    puts "Enjoy the new member of your family!"
  end

end
