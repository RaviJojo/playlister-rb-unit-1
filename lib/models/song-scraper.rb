require_relative '../../environment.rb'

class SongScraper

  attr_accessor :query, :target_page, :lyrics

  SEARCH_URL = "http://www.songlyrics.com/index.php?section=search&searchW="

  EXPLICIT_CONTENT = ["nigga", "pussy", "ass", "shit", "fuck", "vagina", "bitch", "dick", "fuckin'", "fuckin", "fucked"]

  WARNING = "Warning: Explicit Content!"

  def initialize(query)
    @query = query
    @target_page = ''
    @lyrics = ''

    set_all
  end

  def set_all
    parse_search
    scrape_target
    htmlify_lyrics
  end

  def parse_search
    doc = Nokogiri::HTML(open(SEARCH_URL+"#{self.query}"))
    self.target_page = doc.css('div.serpresult').first.css('a').attr('href').text
    puts "grabbed the link from the query #{self.query}"
  end

  def scrape_target # returns a string
    target = Nokogiri::HTML(open(self.target_page))
    self.lyrics = target.css('p#songLyricsDiv').text
    puts "grabbed the lyrics for #{self.query}!"
  end

  def htmlify_lyrics
    self.lyrics.gsub("\n","<br>")
  end


end


class SongYTScraper

  attr_accessor :query, :target_page, :lyrics

  SEARCH_URL = "http://www.youtube.com/results?search_query="

  def initialize(query)
    @query = query
    @target_page = ''

    set_all
  end

  def set_all
    parse_search
  end

  def parse_search
    doc = Nokogiri::HTML(open(SEARCH_URL+"#{self.query}"))
    self.target_page = doc.css('ol a.yt-uix-sessionlink').first.attr('href').split("=").last
    puts "grabbed the embed link from the query #{self.query}"
  end

  # def scrape_target # returns a string
  #     target = Nokogiri::HTML(open("http://www.youtube.com/#{self.target_page}"))
  #     puts "grabbed the  for #{self.query}!"
  # end

  def htmlify_lyrics
    self.lyrics.gsub("\n","<p>")
  end


end





