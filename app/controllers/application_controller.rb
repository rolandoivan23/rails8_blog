class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_user
  helper_method :current_user, :logged_in?

  private
    def set_current_user
      Current.session.user if authenticated?
    end

    def current_user
      Current.session.user if authenticated?
    end
end
