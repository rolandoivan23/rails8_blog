class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_user, :set_followers, :set_following_users
  helper_method :current_user, :logged_in?

  def set_followers
    @followers ||= current_user.followers_users
  end

  def set_following_users
    @following_users ||= current_user.following_users_users
  end

  private
    def set_current_user
      Current.session.user if authenticated?
    end

    def current_user
      Current.session.user if authenticated?
    end
end
