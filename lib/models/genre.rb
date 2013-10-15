class Genre
    attr_accessor :name, :songs, :artists

    @@genres = []

    def initialize
        @name = name
        @songs = []
        @artists = []
        @@genres << self
    end

    def add_song(song)
        self.songs << song
    end

    def self.count
        @@genres.size
    end
    
    def self.reset_genres
        @@genres = []
        true
    end

    def self.all 
        @@genres
    end

    def self.genres # redundant method required to pass genre_spec.rb
        self.all 
    end
end