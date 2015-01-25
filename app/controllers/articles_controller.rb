class ArticlesController < ApplicationController

  require 'open-uri'

  def new
    @article = Article.new
  end

  def create
    @article = Article.find_or_create_by(link: params["article"]["link"])
    if @article
      @article.tag_list.add(params["article"]["tag_list"], :parse => true)
      @article.save
    end
    TitlesWorker.perform_async(@article.id)
    redirect_to home_url(current_user.id)
  end
end
