class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :show_id
      t.integer :venue_id
      t.integer :user_id
      t.date    :date
      t.time    :time
      t.string  :tkts_url
      t.text    :description
      t.timestamps
    end
  end
end
