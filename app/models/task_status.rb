class TaskStatus < ActiveRecord::Base
  belongs_to :task_status
  belongs_to :task
end
