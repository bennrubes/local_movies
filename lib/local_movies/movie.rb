class LocalMovies::Movie
  attr_accessor :title, :showtimes, :rating, :length
  @@all = []

  def initialize(title, rating, length, showtimes)
    @title = title
    @rating = rating
    @length = length
    @showtimes = showtimes
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list
    @@all.each do |movie|
      puts "#{movie.title.upcase}"
      puts "  Rating:" + " #{movie.rating}"
      puts "  Length:" + " #{movie.length}"
      puts "  Showtimes:" + " #{movie.showtimes}".gsub("GetTickets", "")
    end
  end

end