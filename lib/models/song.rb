class Song
    attr_accessor :genre

    def initialize
        @genre = genre
    end

    def genre=(genre)
        @genre = genre
        self.genre.add_song(self)
    end
end
