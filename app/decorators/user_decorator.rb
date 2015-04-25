class UserDecorator < Draper::Decorator
  delegate_all

  def name
    "#{object.firstname} #{object.lastname}"
  end
end
