require_relative './scraper.rb'
class DogBreedSelector::Dog
  attr_accessor :size, :breed, :breed_url, :desc, :breed_size

  @@all = []

  def initialize(breed, breed_url, breed_size, desc = [])
    @breed, @breed_url, @breed_size = breed, breed_url, breed_size
    @desc = desc
    @@all << self
  end

  def self.all_sizes
    @@all.map do |i|
      i.breed_size
    end
  end

  def self.all_desc_by_breed(breed)
    self.all.map do |dogs|
      dogs.breed.map.with_index do |dog, i|
        if dog[i] == breed
          dogs.desc[i]
        end
      end
    end.compact.flatten

  def self.all
    @@all
  end

  def self.all_breeds_by_size(size)
    self.all.map do |dogs|
      if dogs.breed_size == size
        dogs.breed
      end
    end.compact.flatten
  end

  # def self.create_from_size_url(size_array)
  #   #grabs dog size and breed from scraper
  #   size_array.map.with_index do |d, i|
  #     d = new(size_array[i])
  #   end
  # end

end
