require_relative './scraper.rb'
class DogBreedSelector::Dog
  attr_accessor :size, :breed, :breed_url, :desc, :size

  @@all = []

  def initialize(size = nil, breed = nil, breed_url = nil, desc = nil)
    @breed, @breed_url, @size, @desc = breed, breed_url, size, desc
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_sizes
    @@all.map do |dog|
      dog.size
    end.uniq
  end

  def self.list_breeds(size)
    @@all.map do |dog|
      if dog.size == size
        dog.breed unless dog.breed == nil
      end
    end.compact
  end

  def self.desc_by_breed(breed)
    @@all.map do |dog|
      if dog.breed == breed
        dog.desc
      end
    end
  end

  def add_dog_desc(desc)
    desc.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self
  end

  def self.delete_all
    @@all.clear
  end


end
