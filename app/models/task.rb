class Task < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  scope :authored_by, ->(user) { where(author: user) }
  scope :owned_by, ->(user) { where(owner: user) }

  validates_presence_of :name
  validates_presence_of :author
  validates_presence_of :owner
  validates_presence_of :project
  validates_presence_of :status

  belongs_to :author, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  belongs_to :project

  belongs_to :status

  has_many :comments

end
