class Priority < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title
  has_many :task
end
