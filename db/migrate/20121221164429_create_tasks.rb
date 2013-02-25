class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :task
      t.integer :created_by
      t.integer :assigned_to
      t.integer :priority_id
      t.timestamps
    end
  end
end
