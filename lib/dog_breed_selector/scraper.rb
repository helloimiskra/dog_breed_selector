require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './dog.rb'
class DogBreedSelector::Scraper
    attr_accessor :breed_url, :size_urls, :desc, :breed_names, :breed_size, :dog

    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"

    # #iterate the tds .css(td) each, a.text, a.href, array of objects with information
    # #not using instance variables if you dont have to
    # #if statement for number not wanted
    # #fri-sun soft requirement (21-23) Monday morn.


    def self.scrape_size_urls(main_url)
      doc = Nokogiri::HTML(open(main_url))
      size_urls = doc.css('tr td a').map{|x| x.attr('href') if x.attr('href').include?('index')}.uniq!.compact
      size_urls
    end

    def self.scrape_size_names(size_urls)
      size_urls.map do |url|
        doc = Nokogiri::HTML(open(url))
          dogs = []
          doc.css('div#content').map do |doc|
          breed_size = doc.css("h1.clear").text.split("Dog Breed Reviews: ")[1]
          doc.css('tr td').map do |dog|
            breed_name = dog.css('a').text
            breed_url  = "#{dog.css('a').attr('href')}"
            dogs << {breed: breed_name, size: breed_size, url: breed_url}
          end
        end
        dogs
      end

      def self.scrape_breed_page(breed_url)
        dog = {}
        breed_page = Nokogiri::HTML(open(breed_url))
        list = breed_page.css('div.lists').text
        dog[:desc] = list
        dog
      end





end
