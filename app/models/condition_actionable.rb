class ConditionActionable < ActiveRecord::Base
  belongs_to :condition 
  belongs_to :actionable
end
