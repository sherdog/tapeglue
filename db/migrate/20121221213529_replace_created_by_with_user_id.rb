class ReplaceCreatedByWithUserId < ActiveRecord::Migration
  def change
  	remove_column :tasks, :created_by
  	add_column :tasks, :user_id, :integer
  end

  def down
  end
end
