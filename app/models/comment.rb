class Comment < ActiveRecord::Base

  validates :desc, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :task

end
