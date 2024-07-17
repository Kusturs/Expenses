module Authentication
  extend ActiveSupport::Concern

  included do
    private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
    end

    def logged_in?
      current_user.present?
    end

    helper_method :current_user, :logged_in?
  end
end