require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './dog.rb'
class DogBreedSelector::Scraper
    attr_accessor :breed_url, :size_urls, :desc, :breed_names, :breed_size, :dog

    main_url = "https://www.yourpurebredpuppy.com/dogbreeds/"

    def self.scrape_size_urls(main_url)
      doc = Nokogiri::HTML(open(main_url))
      size_urls = doc.css('tr td a').map{|x| x.attr('href') if x.attr('href').include?('index')}.uniq!.compact
      size_urls
    end

    def self.scrape_size_names(size_urls)
      @breed_size = size_urls.map do |url|
        doc = Nokogiri::HTML(open(url))
          doc.css('div#content').map do |doc|
          doc.css("h1.clear").text.split("Dog Breed Reviews: ")[1]
        end
      end.flatten
    end

    def self.scrape_breed_names(size_urls, size)
      size_urls.map.with_index do |url, i|
        if @breed_size[i] == size
          doc = Nokogiri::HTML(open(url))
          breed_names = doc.css('tr td').collect{|a| a.text}.delete_if{|x| x.include?'breeds'}.map{|n| n.gsub("\n\n", '')}
          @breed_url = doc.css('tr td a').map{|x| x.attr('href')}.delete_if{|x| x.include?'breeds'}
        end
        breed_names
      end.compact.flatten
    end

    def self.scrape_from_breed_url(breed_url, breed_names, breed)
      @breed_url.map.with_index do |url, i|
        if breed_names[i] == breed
          doc = Nokogiri::HTML(open(url))
          list = doc.css('div.lists').collect{|a| a.text}
        end
      end.compact.flatten
    end


    # #iterate the tds .css(td) each, a.text, a.href, array of objects with information
    # #not using instance variables if you dont have to
    # #if statement for number not wanted
    # #fri-sun soft requirement (21-23) Monday morn.



end
