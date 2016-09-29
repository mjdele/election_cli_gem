class ElectionCliGem::Polls
  attr_accessor :region, :dem_percent, :rep_percent

  def self.scrape_national
    html = "http://projects.fivethirtyeight.com/2016-election-forecast/"
    doc = Nokogiri::HTML(open(html))

    poll = self.new
    poll.dem_percent = doc.search("div.cardset.current div.candidate.one.dem  p.candidate-val.winprob").text
    poll.rep_percent = doc.search("div.cardset.current div.candidate.three.rep p.candidate-val.winprob").text

    puts "NATIONAL FORECAST --> Hillary Clinton: #{poll.dem_percent} / Donald Trump: #{poll.rep_percent}"
  end

  def self.scrape_state(state)
    puts "MY STATE SCRAPER IS WORKING!!!"
  end


end