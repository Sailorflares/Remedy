class UsersController < ApplicationController

  def show
    @actionable = Actionable.new
    @article = Article.new
    @articles = current_user.articles
    @actionables = current_user.actionables
  end
end
