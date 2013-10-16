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

    def self.genre_duplicate_check(genre_name)
        Genre.all.each do |genre|
            return genre if genre.name.include?(genre_name)
        end
        new_genre = Genre.new
        new_genre.name = genre_name
        new_genre
    end

    def url
        "#{self.name.downcase.gsub(' ', '')}.html"
    end



end