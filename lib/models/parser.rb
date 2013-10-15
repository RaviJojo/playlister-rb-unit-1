require 'pry'

class LibraryParser
require 'pry'

    attr_accessor :files, :path

    def initialize(path)
        @files = []
        @path = path
        fill_files
    end


    def fill_files
        @files = Dir.entries(self.path)
        @files = @files[2..-1]
    end

    def parse_all

    end


    def get_title

    end


    def get_artist(file)
      file.split(" - ").first
    end

    def get_genre(file)
      file.split('[')[-1].split(']').first
    end


end


  # def get_artist
  #     all_artists = @files.collect do |file|
  #       file.split(" - ").first
  #     end
#


# goal
# parser = LibraryParser.new('/Users/avi/fs-playlister-rb/db/data')
# parser.call