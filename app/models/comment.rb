class Comment < ActiveRecord::Base

  validates_presence_of :desc
  validates_presence_of :author

  belongs_to :author, class_name: 'User', foreign_key: "author_id"
  belongs_to :task, class_name: 'Task', foreign_key: "task_id"

end
