class TaskStatus < ActiveRecord::Base
  belongs_to :status
  belongs_to :task
end
