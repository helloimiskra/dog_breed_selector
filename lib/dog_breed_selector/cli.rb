
require_relative './dog.rb'
require_relative './scraper.rb'

class DogBreedSelector::CLI
  attr_accessor :dog_sizes, :breed, :desc, :dog_breeds, :size_urls, :breed_size, :breed_url, :dogs, :list
  
  def call
    self.greeting
    @dog_sizes = DogBreedSelector::Dog.load_sizes
    loop do
      user_input = main_menu
        if user_input === "exit" || user_input.include?("n")
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
    puts "Type 'y' to see more, or 'n' or 'exit' to exit."
    input = gets.strip.downcase
    return input
  end


  def list_dog_sizes
    @dogs = @dog_sizes.map.with_index(1) do |dog, i|
      puts "#{i}. #{dog.breed_size}"
    end
  end

  def choose_dog_size
    puts "Enter the number of the dog breed size you prefer below or type 'exit' "
    @input_one = gets.strip.to_i-1
    @breed_size = @dog_sizes.map{|x| x.breed}[@input_one]
    self.list_all_breeds
  end

  def list_all_breeds
    @breed_size.map.with_index(1){|breed_size, i| puts "#{i}. #{breed_size}"}
  end

  def choose_dog_breed
	   puts "Choose the number of the breed you're interested in, or type 'exit' to exit."
     @input_two = gets.strip.to_i-1
     list_qualities(@input_one, @input_two).each {|desc| puts "\nIf you'd like a dog who ... #{desc}\n"}
   end 

   def list_qualities(input_one, input_two)
     DogBreedSelector::Dog.desc_by_breed(input_one, input_two)
   end
   
   def greeting
    puts "\n\nWoof! Woof!\n\nU ´ᴥ` U\n\n"
    sleep(5)
    puts "Looking to adopt a new furry member of the family?\n\nUncertain of which dog breed is best for you and your family?\n\nYou've come to the right place!\n\n"
    sleep(5)
    puts "With 180 dog breeds to choose from, the Dog Breed Selector will help you make the right choice!\n\nPlease wait a few minutes for the application to load."
  end

  def goodbye
    puts "Enjoy the new member of your family!"
  end



end