class Team < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :user_id
  belongs_to :user #creattor of task

  accepts_nested_attributes_for :user, :allow_destroy => true

  has_many :team_members, :class_name => "Useer", :foreign_key => :invited_by_id

end
