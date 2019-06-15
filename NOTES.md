def menu
  input_one = nil
  puts "Enter the number of the dog breed size you prefer below or type 'exit'"
  while input_one != "exit"
    input_one = gets.strip.downcase

    if input_one.to_i > 0 && input_one.to_i < 7
      breed_size = @dog_sizes[input_one.to_i-1].map{|i| i.breed_size}.join
      list_dog_breeds(breed_size).each.with_index(1) do |breed_size, i|
        puts "#{i}. #{breed_size}"
      end

      puts "Choose the number of the breed you're interested in, or type 'list' to go back to the dog breed sizes."
      input_two = nil
      while input_two != "exit"
        input_two = gets.strip.downcase
        if input_two.to_i > 0 && input_two.to_i < list_dog_breeds(breed_size).length
          list_qualities(input_one, input_two).each{|desc| puts "#{desc}"}
        end
      elsif input_two === "list"
        list_dog_sizes
      elsif input === "exit"
        goodbye
      else
        "Not sure which breed you want? Type a number, 'list' or 'exit' to continue."
      end
    elsif input === "list"
      list_dog_sizes
    elsif input === "exit"
      goodbye
    else
      "Not sure which breed you want? Type 'list' or 'exit' to continue."
    end
  end
end
