class Trail < OpenStruct
  attr_reader :services

  def self.services
    @services = TrailService.new
  end

  def self.all_hiking_locations
    location_hashes = services.all_hiking_locations
    location_hashes.places.map do |location_hash|
      Trail.new(location_hash)
    end
  end

  def self.hiking_locations_by_state(state)
    services.all_hiking_locations(state)
  end

end
