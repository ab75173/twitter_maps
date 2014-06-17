class AddHashtagIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :hashtag_id, :string
  end
end
