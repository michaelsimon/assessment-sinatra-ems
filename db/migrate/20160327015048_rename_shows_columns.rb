class RenameShowsColumns < ActiveRecord::Migration
  def change
    rename_column :shows, :date, :show_date
    rename_column :shows, :time, :show_time
  end
end
