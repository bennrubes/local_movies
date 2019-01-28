class LocalMovies::CLI   
  
  def start   
    puts "Welcome to Local Movies!"
    menu
  end

  def menu
    puts "To help find a movie near you, we will need your zipcode and the date of your movie."
    puts "Please enter your 5 digit zipcode."
    input1 = gets.strip
    case input1
      when /^(?:\d{5})?$/
        puts "Your zipcode has been entered as #{input1}"
      when "exit"
        puts "Thanks for using Local Movies!  Goodbye."
        exit!
      else  
        puts "Please enter a valid zipcode"
        menu
    end
    puts "Please enter the date of your movie as mm/dd/yyyy. If you feel your zipcode is incorrect please type 'back'."
    input2 = gets.strip
    case input2
      when /^((0[1-9]|1[0-2])\/(0[1-9]|[12]\d|3[01])\/([12]\d{3}))/ #need to fix this regex to only except valid date formats as requested
        date = input2.split("/")
        puts "The date you have entered is #{input2}."
      when "back"
        menu
      when "exit"
        puts "Thanks for using Local Movies!  Goodbye."
        exit!
      else
        puts "Either the date you entered or the format is incorrect. Please try again."
        menu
    end
    url = "https://www.imdb.com/showtimes/US/#{input1}/#{date[2]}-#{date[0]}-#{date[1]}?ref_=sh_dt"
    @theater = LocalMovies::Scraper.new.scrape_theaters(url)
    puts "Your nearby theater is #{@theater.name} and it is located at #{@theater.address}."
    LocalMovies::Scraper.new.scrape_movies(url)
    display_movies
  end

  def display_movies
    puts "Here are the movies playing at #{@theater.name}:"
    LocalMovies::Movie.list
  end
end