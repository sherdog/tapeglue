class AddFieldsToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :user_id, :integer
  	add_column :teams, :name, :text
  end
end
