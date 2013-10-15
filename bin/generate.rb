require_relative '../environment.rb'

array = LibraryParser.new(DATA_PATH)
array.call


artists = Artist.all
genres = Genre.all
songs = Song.all

index = ERB.new(File.open('lib/views/index.erb').read)
artists_page = ERB.new(File.open('lib/views/artists.erb').read)
genres_page = ERB.new(File.open('lib/views/genres.erb').read)



File.open('_site/index.html', 'w+') do |f|
  f << index.result(binding)
end

File.open('_site/genres.html', 'w+') do |f|
    f << genres_page.result(binding)
end

File.open('_site/artists.html', 'w+') do |f|
    f << artists_page.result(binding)
end


# show = ERB.new(File.open('lib/templates/show.erb').read)
# # For each dog, first, cast the dog into instance var

# songs.each do |song|
#   File.open("_site/songs/#{song.url}.html", 'w+') do |f|
#     f << show.result(binding)
#   end
# end