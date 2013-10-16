require_relative '../environment.rb'

array = LibraryParser.new(DATA_PATH)
array.call

artists = Artist.all
genres = Genre.all
songs = Song.all

# generate all genre pages using a generic generator, passing in 'genres'
# generate all artist pages similarly
# generate all song pages similarly

# OR: generate all pages via a "site-generator.call" blanket method

# move all below code to separate methods/files
# and then generate them all

# ^ that should probably be part of the general "site-generator.call"

index = ERB.new(File.open('lib/views/index.erb').read)
artists_page = ERB.new(File.open('lib/views/artists.erb').read)
genres_page = ERB.new(File.open('lib/views/genres.erb').read)
artist_page = ERB.new(File.open('lib/views/artist.erb').read)

File.open('_site/index.html', 'w+') do |f|
  f << index.result(binding)
end

File.open('_site/genres.html', 'w+') do |f|
    f << genres_page.result(binding)
end

File.open('_site/artists.html', 'w+') do |f|
    f << artists_page.result(binding)
end


Artist.all.each do |artist_object|
    File.open("_site/#{artist_object.name.downcase.gsub(' ','-')}.html", "w+") do |f|
        f << artist_page.result(binding)
    end
end

