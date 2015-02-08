class User < ActiveRecord::Base
  has_many :user_articles
  has_many :articles, through: :user_articles
  
  has_many :user_actionables
  has_many :actionables, through: :user_actionables

  has_many :user_conditions
  has_many :conditions, through: :user_conditions

  has_many :actionable_events

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

  def calendar_json(start_date, end_date)
    json_array = []
    actionable_events.each do |actionable_event|
      actionable_event.events.each do |date|
        if (start_date..end_date).include?(date)
          json_array << {"title" => actionable_event.title, "start" => date}
        end
      end
    end
    return json_array
  end

  def act_event_ids
    event_ids = []
    actionable_events.each { |a_e| event_ids << a_e.actionable_id }
    return event_ids
  end

end
