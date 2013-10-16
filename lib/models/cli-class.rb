class PlaylisterCLI
  attr_accessor :songs

  APPROVED_COMMANDS = [:list, :play, :help, :exit]

  def initialize(songs)
    @songs = songs
    @on = true
  end

  def on?
    @on
  end

  def call
    choice = ''
    while on?
      while !APPROVED_COMMANDS.include?(choice)
        puts "Type command (list, play, help, or exit):"
        choice = gets.chomp.strip.downcase.to_sym
      end

      self.send(choice)
      choice = ''
    end
  end

  def list
    self.songs.each do |s|
      puts "#{self.songs.index(s)+1}. #{s.name} - #{s.artist.name} - #{s.genre.name}"
    end 
  end

  def help
    puts "Instructions. Type:"
    puts "-------------------------"
    puts "'help' to see this list of commands"
    puts "'list' to list the songs you can view"
    puts "'play' to choose a song to play"
    puts "'exit' to exit."
    puts "-------------------------"
    puts 
  end

  def play
    print "Enter the song number you want to play: "
    number = gets.chomp.to_i
    puts "Playing #{self.songs[number-1].name} by #{self.songs[number-1].artist.name}..."
    puts
  end

  def exit
    puts "Goodbye"
    @on = false
  end
end