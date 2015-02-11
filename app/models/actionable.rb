class Actionable < ActiveRecord::Base
  has_many :user_actionables
  has_many :users, through: :user_actionables

  has_many :condition_actionables
  has_many :conditions, through: :condition_actionables

  has_many :recurring_events
  has_many :events, through: :recurring_events

  has_many :check_ins
end
