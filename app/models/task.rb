class Task < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  belongs_to :project

end
