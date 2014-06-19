class AddGoalToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tweet_goal, :integer
  end
end
