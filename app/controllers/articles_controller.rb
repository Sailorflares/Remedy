class ArticlesController < ApplicationController

  require 'open-uri'

  def new
    @articles = Article.all
    @article = Article.new
  end

  def create
    @article.tag_list.add(params["article"]["tag_list"], :parse => true)
    @article.save
    @article.users << current_user
    TitlesWorker.perform_async(@article.id)
    redirect_to home_url(current_user.id)
  end
end
