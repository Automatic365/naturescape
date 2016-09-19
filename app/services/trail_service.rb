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
    trails = locations.places.map do |location|
      location.name
    end
    cities = locations.places.map do |location|
      location.city
    end
    results = trails.zip(cities)
    formatted_result = results.map do |result|
      result.compact
    end
     formatted_result
  end




  def parse(response)
    JSON.parse(response, object_class: OpenStruct)
  end

end
