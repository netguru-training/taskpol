class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authored_tasks, class_name: 'Task', inverse_of: :author, foreign_key: "author_id"
  has_many :owned_tasks, class_name: 'Task', inverse_of: :owner, foreign_key: "owner_id"

end
