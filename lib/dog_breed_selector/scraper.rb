require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './dog.rb'
class DogBreedSelector::Scraper
    attr_accessor :breed_url, :size_urls, :desc, :breed, :breed_size

    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"

    def self.scrape_from_main(main_url)
      doc = Nokogiri::HTML(open(main_url))
      size_urls = doc.css('tr td a').map{|x| x.attr('href') if x.attr('href').include?('index')}.uniq!.compact
      binding.pry
      size_urls
    end

    def self.scrape_from_size(size_urls)
      size_urls.map do |url|
        doc = Nokogiri::HTML(open(url))
        breeds_doc = doc.css('div#content')
        breeds_doc.map do |doc|
          breed = doc.css('td a').map{|x| x.text}.delete_if{|x| x.include?'breeds'}
          breed_size = doc.css("h1.clear").text.split("Dog Breed Reviews: ")[1]
          breed_url = doc.css('td a').map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
        #   @desc = @breed_url.map do |url|
        #     doc_two = Nokogiri::HTML(open(url))
        #     desc = doc_two.css('div.lists').map{|x| x.text}
        #     desc
        #   end.delete_if{|x| x == ""}
        # end.flatten
        DogBreedSelector::Dog.new(breed, breed_url, breed_size)
      end
    end
    #iterate the tds .css(td) each, a.text, a.href, array of objects with information
    #not using instance variables if you dont have to
    #if statement for number not wanted
    #fri-sun soft requirement (21-23) Monday morn. 

    def self.scrape_from_breed_url(dog)
      desc = dog.breed_url.map do |url|
        doc_two = Nokogiri::HTML(open(url))
        list = doc_two.css('div.lists').map{|x| x.text}
        list
      end.delete_if{|x| x == ""}
      dog.desc = desc
    end

end
