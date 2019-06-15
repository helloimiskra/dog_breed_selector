require_relative './scraper.rb'
class DogBreedSelector::Dog
  attr_accessor :size, :breed, :breed_url, :desc, :breed_size

  @@all = []

  def initialize(breed, breed_url, breed_size, desc = nil)
    @breed, @breed_url, @breed_size = breed, breed_url, breed_size
    @desc = desc
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

  def self.all_breeds_by_size(size)
    @@all.map do |dog|
      if dog.breed_size == size
        dog.breed
      end
    end.compact.flatten
  end

  # def self.all_desc_by_breed(breed)
  #   self.all.map do |dogs|
  #     dogs.breed.map.with_index do |dog, i|
  #       if dog[i] == breed
  #         dogs.desc[i]
  #       end
  #     end
  #   end.compact.flatten


end
