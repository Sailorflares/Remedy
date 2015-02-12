class CalendarController < ApplicationController

  def events_calendar
    start_date =  Date.parse(params['start'])
    end_date =  Date.parse(params['end'])
    events_json = current_user.calendar_json(start_date, end_date)
    respond_to do |format|
      format.json { render json: events_json }
    end    
  end

  def show
    @event_days_hash = current_user.event_days_hash
  end
  
end
