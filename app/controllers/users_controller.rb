class UsersController < ApplicationController

  def show
    @condition = Condition.new
    @actionable = Actionable.new
    @article = Article.new
    @feeling = Feeling.new
    @recurringevent = RecurringEvent.new
    @check_in = CheckIn.new
    @check_ins = current_user.check_ins
    @articles = current_user.articles
    @actionables = current_user.actionables
    @recurring_actionables = current_user.recurring_actionables
    @conditions = current_user.conditions
    @user_recurrences_ids = current_user.recurring_event_ids
    @event_days_hash = current_user.event_days_hash
  end

end
