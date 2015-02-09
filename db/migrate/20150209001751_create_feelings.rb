class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.integer :user_id
      t.date :date_feeling
      t.integer :rating
      t.timestamps null: false
    end
  end
end
