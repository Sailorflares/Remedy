class UsersController < ApplicationController

  def show
    @article = Article.new
    @articles = current_user.articles
  end
end
