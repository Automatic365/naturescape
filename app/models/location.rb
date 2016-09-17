class Location
  attr_reader :services

  def self.services
    @services = LocationService.new
  end

  def self.nearby_current_location(lat, lng, radius = 20)
    services.nearby_current_location(lat, lng, radius = 20)
  end

end
