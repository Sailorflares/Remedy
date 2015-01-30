class ActionableRecurrence < ActiveRecord::Base
  belongs_to :user
  belongs_to :actionable

  def events
    r = Recurrence.new(:every => :day, :interval => days_between_recurrences)
    r.events
  end

end
