class ArticlesController < ApplicationController

  require 'open-uri'

  def new
    @articles = Article.all
    @article = Article.new
  end

  def create
    @article = Article.find_or_create_by(link: params["article"]["link"])
    @article.users << current_user
    TitlesWorker.perform_async(@article.id)
    redirect_to home_url(current_user.id)
  end
end
