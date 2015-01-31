class UsersController < ApplicationController

  def show
    @condition = Condition.new
    @actionable = Actionable.new
    @article = Article.new
    @actionableevent = ActionableEvent.new
    @articles = current_user.articles
    @actionables = current_user.actionables
    @conditions = current_user.conditions
  end

  def events_calendar
    start_date =  Date.parse(params['start'])
    end_date =  Date.parse(params['end'])
    events_json = current_user.calendar_json(start_date, end_date)
    respond_to do |format|
      format.json { render json: events_json }
    end    
  end
end
