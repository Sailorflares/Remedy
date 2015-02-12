class ActionableArticle < ActiveRecord::Base
  belongs_to :actionable
  belongs_to :article
end
