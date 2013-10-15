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




    it "can get the artist name from a file name" do
        
    end

end


