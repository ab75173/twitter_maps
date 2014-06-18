class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :hashtag
      t.text :text
      t.string :user_handle
      t.timestamp
    end
  end
end
