class TrailService
  attr_reader :conn

  def initialize
    @conn = Faraday.new
    @conn.headers["X-Mashape-Key"] = ENV["TRAIL_API_KEY"]
  end

  def all_hiking_locations
    response = conn.get('https://trailapi-trailapi.p.mashape.com/')
    parse(response.body)
  end

  def hiking_locations_by_state(state)
    response = conn.get("https://trailapi-trailapi.p.mashape.com/?q[state_cont]=#{state}")
    parse(response.body)
  end

  def formatted_locations_by_state(state)
    locations = hiking_locations_by_state(state)
    scrubbed_locations = scrub_results(locations)
    names = get_trail_names(scrubbed_locations)
    cities = get_trail_cities(scrubbed_locations)
    get_formatted_result(names, cities)
  end



private

  def parse(response)
    JSON.parse(response, object_class: OpenStruct)
  end

  def get_trail_names(locations)
    locations.map do |location|
      location.name
    end
  end

  def get_trail_cities(locations)
    locations.map do |location|
      location.city
    end
  end

  def get_formatted_result(names, cities)
    results = names.zip(cities)
    results.map do |result|
      result.compact
    end
  end

  def scrub_results(locations)
    locations.places.reject do |location|
      location.lat == 0.0
    end
  end
  #
end
