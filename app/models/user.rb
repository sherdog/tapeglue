class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :project_id

  belongs_to :parent, :class_name => 'User'
  belongs_to :project_id
  has_many :children, :class_name => 'User'
  
  has_many :tasks, :class_name => 'Task', :foreign_key => :user_id
  has_many :assigned_tasks, :class_name => 'Task', :foreign_key => :assigned_user_id
  

  def full_name
    first_name + ' ' + last_name
  end

end
