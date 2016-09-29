class ElectionCliGem::Polls
  attr_accessor :region, :dem_percent, :rep_percent

  def self.scrape_national
    puts "I'm scraping the National poll!!!"
  end


end