class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.integer :user_id
      t.date    :date
      t.integer :actionable_id
      t.timestamps null: false
    end
  end
end
