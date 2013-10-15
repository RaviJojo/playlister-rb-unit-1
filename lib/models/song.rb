class Song
  attr_accessor :name, :genre, :artist

  @@songs = []

  def initialize
    @@songs << self
  end

  def genre=(genre)
    @genre = genre 
    genre.songs << self
  end

end
