class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def index
    @activities = PublicActivity::Activity.all
  end
end
