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

end
