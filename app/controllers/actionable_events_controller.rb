class ActionableEventsController < ApplicationController

  def create
    actionable = Actionable.find(params['actionable_event']['actionable']['id'])
    ae = ActionableEvent.create({
      :user_id => current_user.id,
      :actionable_id => actionable.id,
      :start_date => Date.today,
      :days_between_events => params['actionable_event']['days_between_events'],
      :title => actionable.title
    })
    redirect_to home_url(current_user.id)
  end
end
