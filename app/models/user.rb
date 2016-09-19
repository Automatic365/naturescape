class User < ApplicationRecord
  validates_presence_of :uid, :credentials
  validates_uniqueness_of :uid, :credentials


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider    = auth["provider"]
      user.uid         = auth["uid"]
      user.name        = auth["info"]["name"]
      user.first_name  = auth["info"]["first_name"]
      user.last_name   = auth["info"]["last_name"]
      user.credentials = auth["credentials"]["token"]
      user.image       = auth["info"]["image"]
    end
  end

end
