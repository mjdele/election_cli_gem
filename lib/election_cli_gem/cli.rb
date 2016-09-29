class ElectionCliGem::CLI
  def call
    national_poll
    
  end

  def national_poll
    puts "Who Will Win the Presidency?"
    puts "Today's FiveThirtyEight.com Polling Update:"
    ElectionCliGem::Polls.scrape_national  
  end


end