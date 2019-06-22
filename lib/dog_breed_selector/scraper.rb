require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './dog.rb'
class DogBreedSelector::Scraper
    attr_accessor :breed_url, :size_urls, :desc, :breed, :breed_size, :dog

    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"

    def self.scrape_size_urls(main_url)
      doc = Nokogiri::HTML(open(main_url))
      size_urls = doc.css('tr td a').map{|x| x.attr('href') if x.attr('href').include?('index')}.uniq!.compact
      size_urls
    end

    def self.scrape_size_names(size_urls)
      breed_size = size_urls.map do |url|
        doc = Nokogiri::HTML(open(url))
          doc.css('div#content').map do |doc|
          doc.css("h1.clear").text.split("Dog Breed Reviews: ")[1]
        end
      end.flatten
      binding.pry
      # DogBreedSelector.Dog.new(breed_size)
    end

    def self.scrape_breed_names(size)
      size = "Medium Dog Breeds"
    size_urls.select.with_index do |url, i|
      if breed_size[i] == size
        doc = Nokogiri::HTML(open(url[i]))
        breed = doc.css('tr td a').map{|x| x.text}.delete_if{|x| x.include?'breeds'}.flatten
        breed_url = doc.css('tr td a').map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
        DogBreedSelector::Dog.new(breed, size, breed_url)
      end
    end
    # def self.scrape_from_breed_size(size_url)
    # end
    #
    #
    #
    #
    #
    #   breed_size = size_urls.map do |url|
    #     doc = Nokogiri::HTML(open(url))
    #       doc.css('div#content').map do |doc|
    #       doc.css("h1.clear").text.split("Dog Breed Reviews: ")[1]
    #     end
    #   end.flatten
    #   dog = DogBreedSelector.Dog.new
    #   breed_size.map do |breed|
    #     dog.breed = breed
    #   end
    #   breed_url.map do |url|
    #     dog.breed_url = url
    #   end
    #   breed.map do |breed|
    #     dog.breed = breed
    #   end
    #     # breeds_td = doc.css('tr td a')
    #       breed = breeds_td.map{|x| x.text}.delete_if{|x| x.include?'breeds'}
    #       breed_url = breeds_td.map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
    #     end
    #     breed_size.map do |breed_size| breed_size
    #       breed_url.map do |url| url
    #         breed.map do |breed| breed
    #         end
    #           DogBreedSelector::Dog.new(breed, breed_size, url)
    #       end
    #     end
    #
    #   binding.pry
    # end
    #
    #   #
    #   #   breeds_td = doc.css('tr td a')
    #   #     breed = breeds_td.map{|x| x.text}.delete_if{|x| x.include?'breeds'}
    #   #     breed_url = breeds_td.map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
    #   #   end
    #   # end
    # #
    # #   breed = doc.css('td a').map{|x| x.text}.delete_if{|x| x.include?'breeds'}
    # #   breed_url = doc.css('td a').map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
    # # #       breed = doc.css('td a').map{|x| x.text}.delete_if{|x| x.include?'breeds'}
    # # #       breed_url = doc.css('td a').map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
    # # #     end
    # # #   end
    # # #   breed.map {|breed| DogBreedSelector::Dog.new(breed, breed_size, breed_url)}
    # # #       breed = doc.css('td a').map{|x| x.text}.delete_if{|x| x.include?'breeds'}
    # breed_size.map do |size|
    #   breed_s = size
    #   breed_url.map do |url|
    #     breed_u = url
    #   breed.map do |breed|
    #     DogBreedSelector::Dog.new(breed, breed_s, breed_u)
    #   end
    # end
    # # # #
    # # #
    # # #       DogBreedSelector::Dog.new(breed, breed_size)
    # # #
    # # #     end
    # # #   end
    # # #
    # # #       doc.css('tr td').map do |a|
    # #         breed = doc.css.('a').map{|x| x.text}.delete_if{|x| x.include?'breeds'}
    # #         breed_url = doc.css('a').map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
    # #       end
    # #       DogBreedSelector::Dog.new(breed, breed_url)
    # #
    # #       breed = doc.css('td a').map{|x| x.text}.delete_if{|x| x.include?'breeds'}
    # #
    # #       breed_url = doc.css('td a').map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
    # #     #   @desc = @breed_url.map do |url|
    # #     #     doc_two = Nokogiri::HTML(open(url))
    # #     #     desc = doc_two.css('div.lists').map{|x| x.text}
    # #     #     desc
    # #     #   end.delete_if{|x| x == ""}
    # #     # end.flatten
    # #     DogBreedSelector::Dog.new(breed, breed_url, breed_size)
    # #   end
    # # end
    # #
    # #
    # # def self.scrape_from_breed_url(size_url)
    # #   url =
    #
    #
    # #iterate the tds .css(td) each, a.text, a.href, array of objects with information
    # #not using instance variables if you dont have to
    # #if statement for number not wanted
    # #fri-sun soft requirement (21-23) Monday morn.

    def self.scrape_from_breed_url(dog)
      desc = dog.breed_url.map do |url|
        doc_two = Nokogiri::HTML(open(url))
        list = doc_two.css('div.lists').map{|x| x.text}
        list
      end.delete_if{|x| x == ""}
      dog.desc = desc
    end

end
