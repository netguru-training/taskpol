class TaskDecorator < Draper::Decorator
  delegate_all
  decorates_association :users
  decorates_association :author
  decorates_association :owner
  decorates_association :comments
end
