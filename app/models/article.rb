class Article < ActiveRecord::Base
  has_many :user_articles
  has_many :users, through: :user_articles
  acts_as_taggable
end
