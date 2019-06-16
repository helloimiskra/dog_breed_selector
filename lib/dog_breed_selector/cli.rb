
require_relative './dog.rb'
require_relative './scraper.rb'

class DogBreedSelector::CLI
  attr_accessor :dog_sizes, :breed, :desc, :dog_breeds, :size_urls, :breed_size, :breed_url, :input_one, :input_two, :dogs


  def call
    greeting
    list_dog_sizes
    menu
    # goodbye
  end

  def greeting
    puts "\n\nWoof! Woof!\n\nU ´ᴥ` U\n\n"
    sleep(5)
    puts "Looking to adopt a new furry member of the family?\n\nUncertain of which dog breed is best for you and your family?\n\nYou've come to the right place!\n\n"
    sleep(5)
    puts "The Dog Breed Selector will help you make the right choice!\n\nWait a few minutes, and then select a size below by typing the size's corresponding number."
  end


  def list_dog_sizes
    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"
    @size_urls = DogBreedSelector::Scraper.scrape_from_main(main_url)
    @dog_sizes = DogBreedSelector::Scraper.scrape_from_size(@size_urls)
    @dogs = @dog_sizes.map.with_index(1) do |dog, i|
      puts "#{i}. #{dog.breed_size}"
    end
    @dogs
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
        @breed_size = @dog_sizes.map{|x| x.breed}[input_one.to_i-1]
        @breed_size.map.with_index(1){|breed_size, i| puts "#{i}. #{breed_size}"}
        puts "Choose the number of the breed you're interested in, or type 'list' to go back to the dog breed sizes."

        input_two = nil
        while input_two != "exit"
          input_two = gets.strip.downcase
          if input_two.to_i > 0 && input_two.to_i < breed_size.length
            list = list_qualities(input_one.to_i-1, input_two.to_i-1).each {|desc| sleep(5) puts "\nIf you'd like a dog who ...\n #{desc}\n"}
            puts "Type 'y' if you'd like this breed, \n'n' if you'd want to go back to the breed list for this size, \n'list' to display breed sizes again,\nor 'exit' to exit."
            if list == []
              puts "Sorry. No description is available at this time. Please type 'n' to go back."
            end



            input_three = nil
            while input_three != "exit"
              input_three = gets.strip.downcase
              if input_three == 'y'
                goodbye
                exit_program
              elsif input_three == 'n'
                @breed_size = @dog_sizes.map{|x| x.breed}[input_one.to_i-1]
                @breed_size.map.with_index(1){|breed_size, i| puts "#{i}. #{breed_size}"}
                puts "Choose the number of the breed you're interested in, or type 'list' to go back to the dog breed sizes. (If stuck, type 'exit')"
              elsif input_three == "list"
                list_dog_sizes
                menu
              elsif input_three == "exit"
                exit_program
              else
                "Not sure? Please type 'y', 'n', 'list', or 'exit' to continue."
              end
            end

          elsif input_two === "list"
            list_dog_sizes
          elsif input_two === "exit"
            exit_program
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
  end

  def exit_program
    puts "Input 'exit' to exit."
  end

  def goodbye
    puts "Enjoy the new member of your family!"
  end

end
