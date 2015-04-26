class Comment < ActiveRecord::Base

  validates_presence_of :desc
  validates_presence_of :author

  belongs_to :author, class_name: 'User'
  belongs_to :task

end
