class AlternativeActivity
  attr_reader :services

  def self.services(location, rankby, type)
    @services = AlternativeActivityService.new(location, rankby, type)
  end

  def self.alternative_activity_search(location, rankby, type)
    services(location, rankby, type).find_activities_by_type
  end

end
