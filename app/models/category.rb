class Category < ActiveRecord::Base
  attr_accessible :desc, :title, :id
  has_many :tasks

end
