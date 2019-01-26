class LocalMovies::Scraper   
  
  def self.scrape_theaters(url)
    webpage = Nokogiri::HTML(open(url))
    @array_of_theaters = webpage.css("div#cinemas-at-list.list.detail div.list_item.odd")
    array_of_theater_names = @array_of_theaters.css("div.fav_box h3 a")
    array_of_theater_addresses = @array_of_theaters.css("div.address div span")

    LocalMovies::Theater.new(array_of_theater_names[0].text, array_of_theater_addresses[0..5].text)
  end

  def self.scrape_movies
    array_of_movies = @array_of_theaters[0].css("elements to be scraped")

    array_of_movies.map do |link|
      LocalMovies::Movie.new(link.text, link.attributes)
    end
  end
  
end