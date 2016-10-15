class ElectionCliGem::CLI
  def call
    national_poll
    state_breakdown
    bye
  end

  def national_poll
    puts ""
    puts "WHO WILL WIN THE PRESIDENCY?"
    puts "Today's FiveThirtyEight.com Polling Update:"
    puts ""
    ElectionCliGem::Scraper.new.scrape_national
    poll = ElectionCliGem::Polls.all[0]
    puts "#{poll.region} --> Hillary Clinton: #{poll.dem_percent} / Donald Trump: #{poll.rep_percent}"
  end

  def state_breakdown
    ElectionCliGem::Scraper.new.scrape_states
    puts ""
    puts "Enter a state name to see individual state predictions (for Washington D.C., use 'D.C.') or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      case input
      when "alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "d.c.", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "north dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming"
        poll = ElectionCliGem::Polls.find_state(input.upcase)
        puts ""
        puts "#{poll.region} --> Hillary Clinton: #{poll.dem_percent} / Donald Trump: #{poll.rep_percent}"

        puts ""
        puts "Enter another state or type exit:"
      when "exit"
      else
        puts ""
        puts "Please check your spelling or type exit."
      end
    end
  end

  def bye
    puts ""
    puts "New polls are always coming in. Check back in a few hours to see updated results."
    puts ""
  end
end
