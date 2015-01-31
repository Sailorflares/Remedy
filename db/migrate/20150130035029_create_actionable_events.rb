class CreateActionableEvents < ActiveRecord::Migration
  def change
    create_table :actionable_events do |t|
      t.integer :user_id
      t.integer :actionable_id
      t.date    :start_date
      t.date    :end_date
      t.integer :days_between_events
      t.string  :title
      t.timestamps null: false
    end
  end
end
