class TrailService
  attr_reader :connection

  def initialize
    @connection = Faraday.new
    @connection.headers["X-Mashape-Key"] = ENV["TRAIL_API_KEY"]
  end

  def all_hiking_locations
    response = connection.get('https://trailapi-trailapi.p.mashape.com/')
    parse(response.body)
  end

  def parse(response)
    JSON.parse(response, object_class: OpenStruct)
  end

end
