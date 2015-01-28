class User < ActiveRecord::Base
  has_many :user_articles
  has_many :articles, through: :user_articles
  
  has_many :user_actionables
  has_many :actionables, through: :user_actionables

  has_many :user_conditions
  has_many :conditions, through: :user_conditions

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
