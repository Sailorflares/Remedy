class CreateConditionActionables < ActiveRecord::Migration
  def change
    create_table :condition_actionables do |t|
      t.integer :condition_id
      t.integer :actionable_id
      
      t.timestamps null: false
    end
  end
end
