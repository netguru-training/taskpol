class TaskDecorator < Draper::Decorator
  delegate_all
  decorates_association :users
  decorates_association :author
  decorates_association :owner

  def description
    (object.html_desc.presence || "").html_safe
  end
end
