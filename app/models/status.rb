class Status < ActiveRecord::Base
  has_many :tasks, through: :task_statuses
  has_many :task_statuses
end
