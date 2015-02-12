class Article < ActiveRecord::Base
  has_many :user_articles
  has_many :users, through: :user_articles
  
  acts_as_taggable

  has_many :action_articles
  has_many :actionabes, through: :action_articles
end
