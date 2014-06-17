class ChangeTimeToDateTime < ActiveRecord::Migration
  def change
    rename_column :events, :time, :date_time
  end
end
