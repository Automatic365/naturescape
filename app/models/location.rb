class Location < OpenStruct
  attr_reader :services
  
  def self.services
    @services = LocationService.new
  end

  def self.search_by_current_location
    services.search_by_current_location
  end

  def self.search_by_input_location(address)
    services.search_by_input_location(address)
  end
end
