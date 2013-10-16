require_relative './lib/models/artist.rb'
require_relative './lib/models/song.rb'
require_relative './lib/models/genre.rb'
require_relative './lib/models/parser.rb'
require_relative './lib/models/cli-class.rb'
require_relative './lib/models/site-generator.rb'
require_relative './lib/models/song-scraper.rb'


require 'erb'
require 'pry'
require 'cgi'
require 'nokogiri'
require 'open-uri'

DATA_PATH = "/Users/josephoconor/flatiron/labs/ruby-003-unit-1/playlister/db/data"