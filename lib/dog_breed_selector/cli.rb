class DogBreedSelector::CLI
  
  def call
    greeting
    list_dog_sizes
    menu
    goodbye
    
  end
  
  def greeting
    puts "\n\nWoof! Woof!\n\nU ´ᴥ` U\n\nLooking to adopt a new furry member of the family?\n\nUncertain of which dog breed is best for you and your family?\n\nYou've come to the right place!\n\nSelect a size below:\n\n"
  end
  
  
  def list_dog_sizes
    puts <<-DOC
      1. Tiny Dog Breeds (Height: 5-12" tall | Weight: 3-10 lbs)
      2. Small Dog Breeds (Height: 12-15" tall | Weight: 10-20 lbs)
      3. Midsize Dog Breeds (Height: 15-18" tall | Weight: 20-40 lbs)
      4. Medium Size Dog Breeds (Height: 18 - 22" tall | Weight: 40-60 lbs)
      5. Large Dog Breeds (Height: 22-26" tall | Weight: 60-90 lbs)
      6. Giant Dog Breeds (Height: over 26" tall | Weight: over 100 lbs)
      DOC
    # @dog_sizes = DogBreedSelector::Dog.all_sizes
  end
  
  def list_dog_breeds
    
  end
  
  def menu
    input = nil
     puts "Enter the number of the dog breed size you prefer below or type 'exit'"
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Tiny Dog Breeds to choose from..."
      when "2"
        puts "Small Dog Breeds to choose from..."
      when "3"
        puts "Midsize Dog Breeds to choose from..."
      when "4"
        puts "Medium Breeds to choose from..."
      when "5"
        puts "Large Dog Breeds to choose from..."
      when "6"
        puts "Giant Dog Breeds to choose from..."
      when "list"
        list_dog_sizes
      else 
        puts "Not sure which size you want? Type list or exit."
     end
    end
  end
  
  def goodbye
  puts "Enjoy the new member of your family!"
  end
    
    
end 