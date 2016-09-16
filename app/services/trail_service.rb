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
    response = conn.get("https://trailapi-trailapi.p.mashape.com/?state_cont=#{state}")
    parse(response.body)
  end

  def parse(response)
    JSON.parse(response, object_class: OpenStruct)
  end

end
