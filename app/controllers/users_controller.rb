class UsersController < ApplicationController

  def show
    @condition = Condition.new
    @actionable = Actionable.new
    @article = Article.new
    @articles = current_user.articles
    @actionables = current_user.actionables
    @conditions = current_user.conditions
    @date = params[:month] ? Date.strptime(params[:month], '%Y-%m') : Date.today
    @occurrences = current_user.calendar_array(@date)
  end
end