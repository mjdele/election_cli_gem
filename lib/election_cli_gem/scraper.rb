class ElectionCliGem::Scraper

  def scrape_national
    html = "http://projects.fivethirtyeight.com/2016-election-forecast/"
    doc = Nokogiri::HTML(open(html))

    poll = ElectionCliGem::Polls.new
    poll.region = "NATIONAL FORECAST"
    poll.dem_percent = doc.search("div.cardset.current div.candidate.one.dem  p.candidate-val.winprob").text
    poll.rep_percent = doc.search("div.cardset.current div.candidate.three.rep p.candidate-val.winprob").text

    poll.save
  end

  def scrape_states
    doc = Nokogiri::HTML(open("http://projects.fivethirtyeight.com/2016-election-forecast/"))
    doc.search("div.cardset").each do |cardset|
      poll = ElectionCliGem::Polls.new

      header = cardset.search("h2.forecast.visible")

      if !header.empty?
        poll.region = header.text.gsub("Who will win ", "").chop.upcase
        poll.dem_percent = cardset.search("div.candidate.one.dem  p.candidate-val.winprob").text
        poll.rep_percent = cardset.search("div.candidate.three.rep p.candidate-val.winprob").text

        poll.save
      end
    end
  end


end