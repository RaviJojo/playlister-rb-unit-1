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

    def get_title(path)
        songs_titles = @files.collect do |filename|
            filename[/#{Regexp.escape(" - ")}(.*?)#{Regexp.escape("[")}/m, 1].strip
        end
    end

    def get_artist

    end

    def get_genre

    end






end
binding.pry

#

# goal
# parser = LibraryParser.new('/Users/avi/fs-playlister-rb/db/data')
# parser.call