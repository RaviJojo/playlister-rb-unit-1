class LibraryParser

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

    def get_artist

    end

    def get_genre

    end

    




end


#

# goal
# parser = LibraryParser.new('/Users/avi/fs-playlister-rb/db/data')
# parser.call