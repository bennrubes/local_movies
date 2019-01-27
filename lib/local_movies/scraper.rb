class LocalMovies::Scraper   
  
  def scrape_theaters(url)
    webpage = Nokogiri::HTML(open(url))
    array_of_theaters = webpage.css("div#cinemas-at-list.list.detail div.list_item.odd")
    array_of_theater_names = array_of_theaters.css("div.fav_box h3 a")
    array_of_theater_addresses = array_of_theaters.css("div.address div span")

    LocalMovies::Theater.new(array_of_theater_names[0].text, array_of_theater_addresses[0..5].text)
  end

  def scrape_movies(url)
    webpage = Nokogiri::HTML(open(url))
    array_of_movies = webpage.css("div#cinemas-at-list.list.detail div.list_item.odd")[0].css("div.list_item div.info")

    array_of_movies.map do |movie|
      LocalMovies::Movie.new(movie.css("span a")[0].text, "PG", movie.css("p time").text, movie.css("div.showtimes").text.gsub("\n","").gsub(/\s+/, ""))
    end
  end
  
end