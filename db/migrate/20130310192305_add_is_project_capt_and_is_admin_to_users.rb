class AddIsProjectCaptAndIsAdminToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_team_captain, :integer
  	add_column :users, :is_admin, :integer
  end
end
