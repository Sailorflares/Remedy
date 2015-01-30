class CreateActionableRecurrences < ActiveRecord::Migration
  def change
    create_table :actionable_recurrences do |t|
      t.integer :days_between_recurrences 
      t.integer :actionable_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
