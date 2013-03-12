class Team_members< ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :user_id
  belongs_to :team #creattor of tean

end
