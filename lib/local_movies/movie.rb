class LocalMovies::Movie
  attr_accessor :title, :showtimes, :rating, :length, :description
  @@all = []

  def initialize(title, showtimes, rating, length, description)
    @title = title
    @showtimes = showtimes
    @rating = rating
    @length = length
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list
    @@all.each do |movie|
      puts "#{movie.title.upcase}"
      puts "  description:" + " #{movie.description}"
      puts "  length:" + " #{movie.length}"
      puts "  rating:" + " #{movie.rating}"
      puts "  showtimes:" + " #{movie.showtimes}"
    end
  end

end