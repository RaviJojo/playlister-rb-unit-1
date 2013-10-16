    class LibraryParser
require 'pry'

    attr_accessor :files, :path

    def initialize(path)
        @files = []
        @path = path
        fill_files
    end


    def fill_files
        @files = Dir.entries(self.path)[2..-1]
    end


    def call
        self.files.each do |file|
            title = self.get_title(file)
            artist = self.get_artist(file)
            genre = self.get_genre(file) # a string

            new_song = Song.new
            new_song.name = title

            # check genres
            song_genre = Genre.genre_duplicate_check(genre)
          
            new_song.genre = song_genre

            # check artists
            song_artist = Artist.artist_duplicate_check(artist)

            song_artist.add_song(new_song) 

        end
        songs = Song.all
    end

        # 1. create a new song object
        # 2. add that song to a genre
        # 3. add a genre to the song
        # 4. add that song to an artist's song library
            


    def get_title(file)
        file[/#{Regexp.escape(" - ")}(.*?)#{Regexp.escape(" [")}/m, 1]
    end

    def get_artist(file)
      file.split(" - ").first
    end

    def get_genre(file)
      file.split('[')[-1].split(']').first
    end


end

