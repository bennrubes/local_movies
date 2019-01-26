require "local_movies/version"
require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative 'local_movies/version'
require_relative 'local_movies/cli'
require_relative 'local_movies/scraper'
require_relative 'local_movies/theater'
require_relative 'local_movies/movie'

module LocalMovies
  class Error < StandardError; end
  # Your code goes here...
end
