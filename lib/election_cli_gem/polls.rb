class ElectionCliGem::Polls
  attr_accessor :region, :dem_percent, :rep_percent

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_state(name)
    @@all.detect do |poll|
      poll.region == name
    end
  end


end