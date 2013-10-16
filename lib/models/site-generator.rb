require 'pry'

class Generate

  def make_genres_pages
    genre_page = ERB.new(File.open('lib/views/genre.erb').read)
    Genre.all.each do |genre|
      File.open("_site/#{genre.name.downcase}.html", "w+") do |f|
        f << genre_page.result(binding)
      end      
    end

  end

end

binding.pry