class Project < ActiveRecord::Base
  attr_accessible :active, :description, :image, :name, :id
  has_many :tasks

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"

  
  has_many :projects
end
