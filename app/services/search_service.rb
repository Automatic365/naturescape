class SearchService

  def search_by_current_location
    conn = Faraday.new("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GOOGLE_API_KEY']}")
    response = conn.post
    coordinates = parse(response.body).location
    search_by_coordinates(coordinates.lat, coordinates.lng)
  end

  def search_by_input_location(city, state)
    conn = Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GOOGLE_API_KEY']}")

    response = conn.get do |req|
      req.params['address'] = "#{city}, #{state}"
    end
    parse(response.body)
  end

  def search_by_coordinates(lat,lng)
    conn = Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{lat},#{lng}&key=#{ENV['GOOGLE_API_KEY']}")
    response = conn.get
    parse(response.body)
  end


  private

  def parse(response)
    JSON.parse(response, object_class: OpenStruct)
  end

end
