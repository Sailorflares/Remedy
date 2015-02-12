class CreateActionableArticles < ActiveRecord::Migration
  def change
    create_table :actionable_articles do |t|
      t.integer :actionable_id
      t.integer :article_id
      t.timestamps null: false
    end
  end
end
