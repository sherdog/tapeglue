class CreateUserTasksTable < ActiveRecord::Migration
  def up
  	create_table :users_tasks do |t|
      t.integer :user_id
      t.integer :task_id
    end
  end

  def down
  end
end
