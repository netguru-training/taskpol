class Task < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  validates :name, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  belongs_to :project

  belongs_to :status

  has_many :comments

end
