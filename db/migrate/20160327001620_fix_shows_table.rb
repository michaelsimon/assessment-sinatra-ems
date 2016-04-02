class FixShowsTable < ActiveRecord::Migration
  def change
    rename_column :shows, :show_id, :act_id
    add_column :shows, :name, :string
  end
end
