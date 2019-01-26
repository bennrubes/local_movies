class LocalMovies::CLI   
  
  def start   
    puts "Welcome to Nearby Movie Finder!"
    puts "To help find a movie near you, we will need your zipcode and the date of your movie."
    puts "Please enter your 5 digit zipcode."
    input1 = gets.strip
    puts "Please enter the date of your movie as mm/dd/yyyy."
    input2 = gets.strip
    date = input2.split("/")
    url = "https://www.imdb.com/showtimes/US/#{input1}/#{date[2]}-#{date[0]}-#{date[1]}?ref_=sh_dt"
    theater = LocalMovies::Scraper.new.scrape_theaters(url)
    puts "Your nearby theater is #{theater.name} and it is located at #{theater.address}."
    puts "Here are the movies playing at #{theater.name}:"
    puts "Please select a theater by number."
    
    
    
    
    
    
  end
end