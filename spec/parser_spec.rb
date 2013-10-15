require_relative './spec_helper.rb'



describe LibraryParser do 


    let (:parser) { LibraryParser.new("#{Dir.pwd}/db/data") }

    it "sets a path" do
        parser.path.should eq("#{Dir.pwd}/db/data")
    end

    it "gets all the file names in the path" do
        parser.files.should be_a(Array)
        parser.files.should include("Soulja Boy - Zan With That Lean [hip-hop].mp3")
    end

    it "gets the artist name from a file name" do
        artist1 = parser.get_artist(parser.files.first)
        artist2 = parser.get_artist(parser.files.last)
        artist3 = parser.get_artist("Mr. Muthafuckin eXquire - Huzzah (Remix ft. Despot, Das Racist, Danny Brown and El-P) [rock].mp3")

        artist3.should eq("Mr. Muthafuckin eXquire")





        artist1.should eq("Action Bronson")
        artist2.should eq("Zoo Kid")

    end

    it "gets the genre from a file name" do 
        genre1 = parser.get_genre(parser.files.first)
        genre2 = parser.get_genre(parser.files.last)
        genre3 = parser.get_genre("Mr. Muthafuckin eXquire - Huzzah (Remix ft. Despot, Das Racist, Danny Brown and El-P) [rock].mp3")

        genre3.should eq("rock")

        genre1.should eq("indie")
        genre2.should eq("hip-hop")

    end

    it "gets the song title from a file name" do 
        title1 = parser.get_title(parser.files.first)
        title2 = parser.get_title(parser.files.last)
        title3 = parser.get_title("Mr. Muthafuckin eXquire - Huzzah (Remix ft. Despot, Das Racist, Danny Brown and El-P) [rock].mp3")

        title3.should eq("Huzzah (Remix ft. Despot, Das Racist, Danny Brown and El-P)")
        title1.should eq("Larry Csonka")
        title2.should eq("Out Getting Ribs")

    

    end



end


