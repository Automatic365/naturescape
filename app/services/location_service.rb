class LocationService

  def search(location_info)
  response = Geocoder.search(location_info).first
  parse(response.data.to_json)
  end

  def parse(response)
    JSON.parse(response, object_class: OpenStruct)
  end

end
