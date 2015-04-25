class UserDecorator < Draper::Decorator

  def name
    "#{object.firstname} #{object.lastname}"
  end

end
