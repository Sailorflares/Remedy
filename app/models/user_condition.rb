class UserCondition < ActiveRecord::Base
  belongs_to :user
  belongs_to :condition
end
