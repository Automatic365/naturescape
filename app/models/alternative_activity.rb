class AlternativeActivity
  attr_reader :services

  def self.services(lat, lng, type)
    @services = AlternativeActivityService.new(lat, lng, type)
  end

  def self.alternative_activity_search(lat, lng, type)
    services(lat, lng, type).find_activities_by_type
  end

end
