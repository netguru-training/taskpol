class Task < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  scope :authored_by, ->(user) { where(author: user) }
  scope :owned_by, ->(user) { where(owner: user) }

  validates :name, presence: true

  belongs_to :author, class_name: 'User', counter_cache: true
  belongs_to :owner, class_name: 'User', counter_cache: true

  belongs_to :project

  belongs_to :status

  has_many :comments

end
