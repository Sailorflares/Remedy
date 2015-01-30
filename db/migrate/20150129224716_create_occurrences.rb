class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.date :date
      t.string :title

      t.timestamps null: false
    end
  end
end
