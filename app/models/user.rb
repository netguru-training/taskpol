class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authored_tasks, class_name: 'Task', inverse_of: :author, foreign_key: "author_id"
  has_many :owned_tasks, class_name: 'Task', inverse_of: :owner, foreign_key: "owner_id"

  has_many :authored_projects, class_name: 'Project', inverse_of: :author, foreign_key: "author_id"

  has_many :authored_commments, class_name: 'Comment', inverse_of: :author, foreign_key: "author_id"

  has_many :projects, through: :project_users
  has_many :project_users, dependant: :destroy

  def amount_owner_tasks
    Task.where(owner_id: self.id).count
  end

  def amount_author_tasks
    Task.where(author_id: self.id).count
  end

  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  def active_for_authentication?
    super && !deleted_at
  end
end
