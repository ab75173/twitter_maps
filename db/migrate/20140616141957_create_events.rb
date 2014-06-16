class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :hashtag
      t.string :title
      t.text :description
      t.float :latitude
      t.float :longitude
      t.date :date
      t.time :time
    end
  end
end
