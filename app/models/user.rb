class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :project_id, :avatar

  belongs_to :team_member, :class_name => 'User', foreign_key: 'invited_by_id'
  belongs_to :project_id

  has_many :children, :class_name => 'User'
  
  has_many :tasks, :class_name => 'Task', :foreign_key => :user_id
  has_many :assigned_tasks, :class_name => 'Task', :foreign_key => :assigned_user_id
  
  has_many :teams

  has_many :team_members, :class_name => "User", :foreign_key => :invited_by_id

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "images/missing.png"

  def full_name
    if first_name.blank? || last_name.blank?
      "Guest"
    else
      first_name + ' ' + last_name
    end
    
  end

  def valid_for_authentication?
    result = super
    self.is_active?
  end

  def is_owner

      user = User.find(current_user.id)
      return user.invited_by_id

  end


end
