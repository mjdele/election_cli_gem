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
    ElectionCliGem::Polls.scrape_national  
  end

  def state_breakdown
    puts ""
    puts "Enter a state name to see individual state predictions (for D.C., use 'district of columbia') or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase.gsub(" ", "-")

      case input
      when "alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "district-of-columbia", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new-hampshire", "new-jersey", "new-mexico", "new-york", "north-carolina", "north-dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode-island", "south-carolina", "south-dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west-virginia", "wisconsin", "wyoming"
        puts ""
        ElectionCliGem::Polls.scrape_state(input)
        puts ""
        puts "Enter another state or type exit:"
      when "exit"
      else
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