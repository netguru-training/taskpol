class Project < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  has_many :tasks
  has_many :users, through: :project_users
  has_many :project_users
  belongs_to :author, class_name: 'User'

  validates_presence_of :title
  validates_presence_of :author
  validates_uniqueness_of :title

end
