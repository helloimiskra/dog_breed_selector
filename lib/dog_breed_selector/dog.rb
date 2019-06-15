require_relative './scraper.rb'
class DogBreedSelector::Dog
  attr_accessor :size, :breed, :breed_url, :desc, :breed_size

  @@all = []

  def initialize(breed, breed_url, breed_size, desc = [])
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

  def self.desc_by_breed(breed)
    @@all.map.with_index do |dog, i|
      if dog.breed[i].include?(breed)
        dog.desc[i]
      end
    end.compact
  end




end
