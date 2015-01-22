class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :url
      t.string :title
      
      t.timestamps null: false
    end
  end
end
