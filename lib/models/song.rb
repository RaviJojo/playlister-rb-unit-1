class Song
    attr_accessor :genre, :name, :artist

    def initialize
        @genre = genre
    end

    def genre=(genre)
        @genre = genre
        self.genre.add_song(self)
    end

end
