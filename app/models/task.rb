class Task < ActiveRecord::Base

  attr_accessible :assigned_user_id, :priority_id, :task, :title, :date_due, :user_id, :category_id, :asset, :assets_attributes, :project_id
  belongs_to :user #creattor of task
  belongs_to :assigned_user, :class_name => 'User'
  belongs_to :category
  belongs_to :priority
  belongs_to :project

  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true

  

end
