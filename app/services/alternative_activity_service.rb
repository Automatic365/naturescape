class AlternativeActivityService
  attr_reader :conn

  def initialize(lat,lng,type)
    @conn = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=#{ENV['GOOGLE_API_KEY']}&location=#{lat},#{lng}&rankby=distance&type=#{type}")
  end

  def find_activities_by_type
    # require "pry"; binding.pry
    response = conn
    parse(response.body)
  end

  private

  def parse(response)
    JSON.parse(response, object_class: OpenStruct)
  end

end
