
# below is not working yet.

class Generate
  attr_accessor :all_genres
  

  def initialize
    @all_genres = Genre.all
  end

  def make_genres_pages
    genre_page = ERB.new(File.open('lib/views/genre.erb').read)

    @all_genres.each do |genre|
      File.open("_site/#{genre.name.downcase}.html", "w+") do |f|
        f << genre_page.result(binding)
      end      
    end

  end

end

binding.pry