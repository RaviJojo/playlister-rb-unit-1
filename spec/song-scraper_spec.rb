require 'spec_helper'


describe SongScraper do 

  puts "Calling a live scraper! Please wait."
  let (:sc) {SongScraper.new("cake+comfort+eagle")}

  it "retrieves a link from the search results page given a valid query" do

    sc.target_page.should end_with("-lyrics/")
    sc.target_page.count("/").should eq(5)

  end

  it "retrieves the song lyrics from the target page" do 

    sc.lyrics.should include("e")


  end

  it "inserts HTML into the lyrics to make them more readable in a browser" do 

    sc.htmlify_lyrics.should include("<")

  end


end

