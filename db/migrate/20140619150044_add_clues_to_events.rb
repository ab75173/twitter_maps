class AddCluesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_clue_one, :text
    add_column :events, :event_clue_two, :text
  end
end
