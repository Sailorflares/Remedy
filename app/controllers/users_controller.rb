class UsersController < ApplicationController

  def show
    @condition = Condition.new
    @actionable = Actionable.new
    @article = Article.new
    @articles = current_user.articles
    @actionables = current_user.actionables
    @conditions = current_user.conditions
  end
end
