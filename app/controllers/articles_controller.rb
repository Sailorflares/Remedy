class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.find_or_create_by(link: params["article"]["link"])
    redirect_to home_url(current_user.id)
  end
end
