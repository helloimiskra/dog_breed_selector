
require_relative './dog.rb'
require_relative './scraper.rb'

class DogBreedSelector::CLI
  attr_accessor :dog_sizes, :breed, :desc, :dog_breeds, :size_urls, :breed_size, :breed_url, :input_one, :input_two


  def call
    greeting
    list_dog_sizes
    menu
    # goodbye
  end

  def greeting
    puts "\n\nWoof! Woof!\n\nU ´ᴥ` U\n\nLooking to adopt a new furry member of the family?\n\nUncertain of which dog breed is best for you and your family?\n\nYou've come to the right place!\n\n"
    puts "\nNow loading...\n"
    puts "\n\nSelect a size below:\n\n"
  end


  def list_dog_sizes
    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"
    @size_urls = DogBreedSelector::Scraper.scrape_from_main(main_url)
    @dog_sizes = DogBreedSelector::Scraper.scrape_from_size(@size_urls)
    @dog_sizes.map.with_index(1) do |dog, i|
      puts "#{i}. #{dog.breed_size}"
    end
  end

  # def list_dog_breeds(size)
  #   @dog_breeds = DogBreedSelector::Dog.all_breeds_by_size(size)
  # end

  def list_qualities(input_one, input_two)
    DogBreedSelector::Dog.desc_by_breed(input_one, input_two)
  end

  def menu
    input_one = nil
    puts "Enter the number of the dog breed size you prefer below or type 'exit'"

    while input_one != "exit"
      input_one = gets.strip.downcase

      if input_one.to_i > 0 && input_one.to_i < 7
        breed_size = @dog_sizes.map{|x| x.breed}[input_one.to_i-1]
        breed_size.map.with_index(1) do |breed_size, i|
          puts "#{i}. #{breed_size}"
        end
        puts "Choose the number of the breed you're interested in, or type 'list' to go back to the dog breed sizes."
      input_two = nil
      while input_two != "exit"
        input_two = gets.strip.downcase
        if input_two.to_i > 0 && input_two.to_i < breed_size.length
          list_qualities(input_one.to_i-1, input_two.to_i-1).each {|desc| puts "\nIf you'd like a dog who ...\n #{desc}"}
        end
          puts "Type 'y' if you'd like this breed, \n'n' if you'd want to go back to the breed list for this size, \n'list' to display breed sizes again,\nor 'exit' to exit."
        input_three = nil
        while input_three != "exit"
          input_three = gets.strip.downcase

          if input_three == 'y'
            goodbye
          elsif input_three == 'n'
            breed_size = @dog_sizes.map{|x| x.breed}[input_one.to_i-1]
            breed_size.map.with_index(1) do |breed_size, i|
              puts "#{i}. #{breed_size}"
            end
            puts "Choose the number of the breed you're interested in, or type 'list' to go back to the dog breed sizes."
          elsif input_three == "list"
            list_dog_sizes
          elsif input_three == "exit"
            goodbye
          else
            "Not sure? Please type 'y', 'n', 'list', or 'exit' to continue."
          end
      end

        elsif input_two === "list"
          list_dog_sizes
        elsif input_two === "exit"
            goodbye
        else
          "Not sure which breed you want? Type a number, 'list' or 'exit' to continue."
        end
      end
      elsif input_one === "list"
        list_dog_sizes
      elsif input_one === "exit"
        goodbye
      else
        "Not sure which breed you want? Type 'list' or 'exit' to continue."
      end
  end

  def goodbye
    puts "Enjoy the new member of your family!"
  end

end
