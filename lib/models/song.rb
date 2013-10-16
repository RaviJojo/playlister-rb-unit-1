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

  def self.all 
    @@songs 
  end

  def url
    "#{self.name.downcase.gsub(' ', '-')}.html"
  end
  
end
