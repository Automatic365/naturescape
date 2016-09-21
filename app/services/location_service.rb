# class LocationService
#   attr_reader :conn
#
#   def initialize
#     @conn = Faraday.new("https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=#{ENV['GOOGLE_API_KEY']}")
#   end
#
#   def nearby_current_location(lat, lng, radius = 20)
#     response = conn.get do |req| #("&location=#{lat},#{lng},&radius=#{radius}")
#       req.params['location'] = "#{lat},#{lng}"
#       req.params['radius'] = radius
#     end
#     parse(response.body)
#   end
#
#
#   private
#
#   def parse(response)
#     JSON.parse(response, object_class: OpenStruct)
#   end
#
# end
