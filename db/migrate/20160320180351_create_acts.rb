class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :name
      t.text   :description
      t.string :size
      t.string :location
      t.string :website
      t.timestamps
    end
  end
end
