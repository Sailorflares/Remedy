class User < ActiveRecord::Base
  has_many :user_articles
  has_many :articles, through: :user_articles
  
  has_many :user_actionables
  has_many :actionables, through: :user_actionables

  has_many :user_conditions
  has_many :conditions, through: :user_conditions

  has_many :actionable_recurrences

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

  def calendar_array(date)
    return_array = []
    actionables_array = self.actionable_recurrences
    
    (date.beginning_of_month..date.end_of_month).each do |date|
      
      actionables_array.each do |actionable_reccurrence|
        
        if actionable_reccurrence.events.include?(date)
          title = actionable_reccurrence.actionable.title
          new_occurrence = Occurrence.new({:date => date, :title => title})
          return_array << new_occurrence
        end
      
      end
    end
    
    return return_array
  end

end
