require 'pry'

class User < ActiveRecord::Base
  has_many :user_articles
  has_many :articles, through: :user_articles
  
  has_many :user_actionables
  has_many :actionables, through: :user_actionables

  has_many :user_conditions
  has_many :conditions, through: :user_conditions

  has_many :recurring_events

  has_many :feelings

  has_many :check_ins

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
    recurring_events.each do |recurring_event|
      recurring_event.events.each do |date|
        if (start_date..end_date).include?(date)
          json_array << {"title" => recurring_event.title, "start" => date}
        end
      end
    end
    return json_array
  end

  def recurring_event_ids
    event_ids = []
    recurring_events.each { |recurring_event| event_ids << recurring_event.actionable_id }
    return event_ids
  end

  def daysInUse(actionable_id)
    recurring_event = RecurringEvent.find_by(user_id: self.id, actionable_id: actionable_id)
    days = Date.today - recurring_event.start_date
    return days.to_i
  end

  def event_days_hash
  # Note this currently only functions when event doesn't have multiple starts & stops (actionable_events) 
    event_days = {}
    recurring_event_ids.each do |id|
      event_days[id] = daysInUse(id) 
    end
    return event_days
  end

  def recurring_actionables
    actionables_array = []
    actionables.each do |actionable|
      actionables_array << actionable if recurring_event_ids.include?(actionable.id)
    end
    actionables_array
  end

  def graph_data(date)
    data_array = [['Date']]
    recurring_actionables.each do |actionable|
      data_array[0] << actionable.title
    end
    data_array[0] << 'Feeling'
    (Date.today-7..Date.today).each do |date|
      day_data = [date.to_s]
      check_in_array = CheckIn.where(user_id: id, date: date).pluck(:actionable_id)
      recurring_actionables.each do |actionable|
        check_in_array.include?(actionable.id) ? check_in_occurred = 1 : check_in_occurred = 0 
        day_data << check_in_occurred
      end
      feeling = Feeling.find_by(user_id: id, date_feeling: date)
      feeling ? day_data << feeling.rating : day_data << 0
      data_array << day_data
    end  
    return data_array
  end

end