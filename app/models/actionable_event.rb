class ActionableEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :actionable

  def events
    r = Recurrence.new({
      :every => :day, 
      :interval => days_between_events,
      :starts => start_date,
      :ends => end_date
    })
    r.events
  end

end
