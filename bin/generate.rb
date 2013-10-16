require_relative '../environment.rb'

array = LibraryParser.new(DATA_PATH)
array.call


artists = Artist.all
genres = Genre.all
songs = Song.all

# pages_required = ["index", "artists", "genres", "artist", "genre"]

# gen = SiteGenerator.new(Artist.all, Genre.all, Song.all)

# files = pages_required.collect do |page|
#     template = gen.create_erb_object(page)
#     gen.create_html_file(template)
# end


index = ERB.new(File.open('lib/views/index.erb').read)
artists_page = ERB.new(File.open('lib/views/artists.erb').read)
genres_page = ERB.new(File.open('lib/views/genres.erb').read)

artist_page = ERB.new(File.open('lib/views/artist.erb').read)
genre_page = ERB.new(File.open('lib/views/genre.erb').read)
song_page = ERB.new(File.open('lib/views/song.erb').read)


File.open('_site/index.html', 'w+') do |f|
  f << index.result(binding)
end

File.open('_site/genres.html', 'w+') do |f|
    f << genres_page.result(binding)
end

File.open('_site/artists.html', 'w+') do |f|
    f << artists_page.result(binding)
end

def create_pages
end

artists.each do |artist_object|
    File.open("_site/artists/#{artist_object.url}", "w+") do |f|
        f << artist_page.result(binding)
    end
end

genres.each do |genre_object|
    File.open("_site/genres/#{genre_object.url}", "w+") do |f|
        f << genre_page.result(binding)
    end
end

songs.each do |song_object|
    File.open("_site/songs/#{song_object.url}", "w+") do |f|
        f << song_page.result(binding)
    end
end




# show = ERB.new(File.open('lib/templates/show.erb').read)
# # For each dog, first, cast the dog into instance var

# songs.each do |song|
#   File.open("_site/songs/#{song.url}.html", 'w+') do |f|
#     f << show.result(binding)
#   end
# end