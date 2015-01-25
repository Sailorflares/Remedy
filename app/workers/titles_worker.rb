class TitlesWorker
  include Sidekiq::Worker
  require 'open-uri'

  def perform(article_id)
    article = Article.find(article_id)
    doc = Nokogiri::HTML(open(article.link))
    article.title = doc.css('title').to_s.gsub(/<\/?title>/,'')
    article.save
  end

end