require 'pry'
class Artist
    attr_accessor :name, :songs, :genres

    @@artists = []  

    def initialize
       @name = name
       @songs = []
       @genres = []
       @@artists << self
    end

    def add_song(song) # should take song object
        self.songs << song
        self.genres << song.genre # add the song's genre to the artist's @genres

        song.artist = self # add artist to the song's

        if song.genre # check to make sure the song has been given a genre
            if !song.genre.artists.include?(self) # check to see if the artist has already been included in the genre
                song.genre.artists << self # if not, add to @artists of the genre
            end
        end

    end

    def self.all
        @@artists
    end

    def self.count
        self.all.size
    end

    def self.reset_artists
        @@artists = []
        true
    end

    def self.artist_duplicate_check(artist_name)
        if !Artist.all.empty?
            Artist.all.each do |artist|
                return artist if artist.name.include?(artist_name)
            end
        end
        new_artist = Artist.new
        new_artist.name = artist_name
        new_artist
    end

    def url
        "#{self.name.downcase.gsub(' ', '-')}.html"
    end
    

end
