require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './dog.rb'
class DogBreedSelector::Scraper
    attr_accessor :breed_url, :size_urls

    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"

    def self.scrape_from_main(main_url)
      doc = Nokogiri::HTML(open(main_url))
      size_urls = doc.css('tr td a').map{|x| x.attr('href') if x.attr('href').include?('index')}.uniq!.compact
      size_urls
    end

    def self.scrape_from_size(size_urls)
      size_urls.map do |url|
        doc = Nokogiri::HTML(open(url))
        breeds_doc = doc.css('div#content')
        breeds_doc.map do |doc|
          breed = doc.css('td a').map{|x| x.text}.delete_if{|x| x.include?'breeds'}
          breed_url = doc.css('td a').map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
          breed_size = doc.css("h1.clear").text.split("Dog Breed Reviews: ")[1]
          DogBreedSelector::Dog.new(breed, breed_url, breed_size)
        end
      end
    end

    def self.scrape_from_profile
      breed_urls = DogBreedSelector::Dog.all.map{|d| d.breed_url}.flatten
      breed_urls.map do |url|
        doc = Nokogiri::HTML(open(url))
        @details = doc.css('div.lists').text
        DogBreedSelector::Dog.all.map do |dog|
          dog.desc << @details
        end
      end
    end
  #   doc = Nokogiri::HTML(open("https://www.yourpurebredpuppy.com/reviews/americancockerspaniels.html"))
  #  details = doc.css('div.lists').text

end
