class ProjectDecorator < Draper::Decorator
  delegate_all
  decorates_association :users

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def author_name
    "#{object.author.firstname} #{object.author.lastname}"
  end

end
