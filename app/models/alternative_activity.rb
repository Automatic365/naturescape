class AlternativeActivity
  attr_reader :services

  def self.services(lat, lng, radius, type)
    @services = AlternativeActivityService.new(lat, lng, radius, type)
  end

  def self.alternative_activity_search(lat, lng, radius, type)
    services(lat, lng, radius, type).find_activities_by_type
  end

end
