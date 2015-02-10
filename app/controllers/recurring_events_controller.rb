class RecurringEventsController < ApplicationController

  def create
    actionable = Actionable.find(params['recurring_event']['actionable']['id'])
    recurring_event = RecurringEvent.create({
      :user_id => current_user.id,
      :actionable_id => actionable.id,
      :start_date => Date.today,
      :days_between_events => params['recurring_event']['days_between_events'],
      :title => actionable.title
    })
    redirect_to home_url(current_user.id)
  end
end
