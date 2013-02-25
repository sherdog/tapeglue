class Project < ActiveRecord::Base
  attr_accessible :active, :description, :image, :name, :id
  has_many :tasks
  
  has_many :projects
end
