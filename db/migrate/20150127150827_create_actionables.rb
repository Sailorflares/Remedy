class CreateActionables < ActiveRecord::Migration
  def change
    create_table :actionables do |t|
      t.string :title
      t.string :text
      
      t.timestamps null: false
    end
  end
end
