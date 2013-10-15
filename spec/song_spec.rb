require_relative './spec_helper.rb'

describe "Song" do
  it "can initialize a song" do
    Song.new.should be_an_instance_of(Song)
  end

  it "can have a name" do
    song = Song.new
    song.name = "Sabatoge"
    song.name.should eq("Sabatoge")
  end

  it "can have a genre" do
    song = Song.new
    song.genre = Genre.new.tap { |genre| genre.name = "rap" }
    song.genre.name.should eq("rap")
  end

  it "has an artist" do
    artist = Artist.new
    song = Song.new
    artist.add_song(song)
    song.artist.should == artist
    song.artist.class.should == Artist
  end
end
