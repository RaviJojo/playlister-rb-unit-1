require 'pry'

class LibraryParser

    attr_accessor :files, :path

    def initialize(path)
        @files = []
        @path = path
        fill_files
    end


    def fill_files
        @files = Dir.entries(self.path)
    end

    def get_title
        
    end

    def get_artist
      all_artists = @files.collect do |file|
        file.split(" - ").first
      end
    end

    def get_genre

    end

end

binding.pry

#

# goal
# parser = LibraryParser.new('/Users/avi/fs-playlister-rb/db/data')
# parser.call