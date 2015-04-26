class CommentDecorator < Draper::Decorator
  delegate_all
  decorates_association :users
  decorates_association :author
  decorates_association :tasks

end
