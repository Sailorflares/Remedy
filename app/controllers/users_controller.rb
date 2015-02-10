class UsersController < ApplicationController

  def show
    @condition = Condition.new
    @actionable = Actionable.new
    @article = Article.new
    @feeling = Feeling.new
    @recurringevent = RecurringEvent.new
    @articles = current_user.articles
    @actionables = current_user.actionables
    @conditions = current_user.conditions
    @user_recurrences_ids = current_user.recurring_event_ids
    @event_days_hash = current_user.event_days_hash
  end

end
