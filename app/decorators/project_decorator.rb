class ProjectDecorator < Draper::Decorator
  delegate_all
  decorates_association :users

  def author_name
    "#{object.author.firstname} #{object.author.lastname}"
  end

end
