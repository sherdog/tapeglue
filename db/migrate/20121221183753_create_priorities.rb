class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :title
      t.timestamps
    end
  end
end
