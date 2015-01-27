class CreateUserActionables < ActiveRecord::Migration
  def change
    create_table :user_actionables do |t|
      t.integer :user_id
      t.integer :actionable_id

      t.timestamps null: false
    end
  end
end
