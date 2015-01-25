class UsersController < ApplicationController

  def show
    @article = Article.new
    @articles = Article.all
  end
end
