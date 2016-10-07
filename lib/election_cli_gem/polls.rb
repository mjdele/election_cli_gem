class ElectionCliGem::Polls
  attr_accessor :region, :dem_percent, :rep_percent

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end


end