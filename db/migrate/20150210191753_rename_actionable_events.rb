class RenameActionableEvents < ActiveRecord::Migration
  def self.up
      rename_table :actionable_events, :recurring_events
  end
  def self.down
      rename_table :recurring_events, :actionable_events
  end
end