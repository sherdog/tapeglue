class RenameAssignedToToAssignedUserId < ActiveRecord::Migration
  def up
  	rename_column :tasks, :assigned_to, :assigned_user_id
  end

  def down
  end
end
