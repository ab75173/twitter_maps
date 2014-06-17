class EditUsersEventsName < ActiveRecord::Migration
  def change
    rename_table :users_events, :favorites
  end
end
