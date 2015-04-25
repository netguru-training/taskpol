class ProjectDecorator < Draper::Decorator
  delegate_all
  decorates_association :users
  decorates_association :author

  def author_name
    "#{object.author.firstname} #{object.author.lastname}"
  end

end
