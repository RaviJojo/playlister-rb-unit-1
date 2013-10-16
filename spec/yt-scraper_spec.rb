require 'spec_helper'


describe SongYTScraper do 

  it "returns a YouTube video identifier link of the proper length" do 

    puts "Calling a live scraper! Please wait one moment"

    sc = SongYTScraper.new("john+coltrane")
    sc.target_page.length.should eq(11)

  end


end




# youtube video identifier links
  # ob3ktDxAjWI
  # e_9_vC2-6pg