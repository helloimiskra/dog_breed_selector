
require_relative './dog.rb'
require_relative './scraper.rb'

class DogBreedSelector::CLI
  attr_accessor :dog_sizes, :breed, :desc, :dog_breeds


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
    @dog_sizes = DogBreedSelector::Scraper.scrape_from_size
    # @dog_sizes.each.with_index(1) do |dog, i|
    #    puts "#{i}. #{dog}"
    #  end
  end

  def list_dog_breeds(size)
    @dog_breeds = DogBreedSelector::Dog.all_breeds_by_size(size)
  end

  def menu
    input = nil
    puts "Enter the number of the dog breed size you prefer below or type 'exit'"
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 7
        breed_size = @dog_sizes[input.to_i-1]
        puts "#{dog}"
        list_dog_sizes[the_dog].each.with_index(1) do |the_dog, i|
          puts "#{i}. #{dog}"
        end
      elsif input === "list"
        list_dog_sizes
      elsif input === "exit"
        goodbye
      else
        "Not sure which breed you want? Type 'list' or 'exit'to continue."
      end
    end
  end

  def goodbye
    puts "Enjoy the new member of your family!"
  end


end
