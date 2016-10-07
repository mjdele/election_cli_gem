class ElectionCliGem::Scraper

  def scrape_national
    html = "http://projects.fivethirtyeight.com/2016-election-forecast/"
    doc = Nokogiri::HTML(open(html))

    poll = ElectionCliGem::Polls.new
    poll.dem_percent = doc.search("div.cardset.current div.candidate.one.dem  p.candidate-val.winprob").text
    poll.rep_percent = doc.search("div.cardset.current div.candidate.three.rep p.candidate-val.winprob").text

    puts "NATIONAL FORECAST --> Hillary Clinton: #{poll.dem_percent} / Donald Trump: #{poll.rep_percent}"
  end

  def scrape_state(state)
    html = "http://projects.fivethirtyeight.com/2016-election-forecast/#{state}"
    doc = Nokogiri::HTML(open(html))

    poll = ElectionCliGem::Polls.new
    poll.region = doc.search("div.cardset.current h2.card-header-title.forecast.visible").text.gsub("Who will win ", "").chop
    poll.dem_percent = doc.search("div.cardset.current div.candidate.one.dem  p.candidate-val.winprob").text
    poll.rep_percent = doc.search("div.cardset.current div.candidate.three.rep p.candidate-val.winprob").text

    puts "#{poll.region.upcase} --> Hillary Clinton: #{poll.dem_percent} / Donald Trump: #{poll.rep_percent}"
  end


end