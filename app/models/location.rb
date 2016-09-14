class Location < OpenStruct
  attr_reader :services
  # geocoded_by :address
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :geocode, :reverse_geocode

  def self.services
    @services = LocationService.new
  end

  def self.search(location)
    services.search(location)
  end
end
