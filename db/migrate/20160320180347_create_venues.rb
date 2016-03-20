class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :phone
      t.string :email
      t.string :website
      t.timestamps
    end
  end
end
