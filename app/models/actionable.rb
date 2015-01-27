class Actionable < ActiveRecord::Base
  has_many :user_actionables
  has_many :users, through: :user_actionables


end
