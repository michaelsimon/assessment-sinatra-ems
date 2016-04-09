class CreateUserIdColumns < ActiveRecord::Migration
  def change
    add_column :venues, :user_id, :integer
    add_column :acts, :user_id, :integer
  end
end
