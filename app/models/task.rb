class Task < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  belongs_to :project

  has_many :statuses, through: :task_statuses
  has_many :task_statuses, dependent: :destroy

end
