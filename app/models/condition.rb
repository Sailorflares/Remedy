class Condition < ActiveRecord::Base
  has_many :user_conditions
  has_many :users, through: :user_conditions
  
  has_many :condition_actionables
  has_many :actionables, through: :condition_actionables
end
