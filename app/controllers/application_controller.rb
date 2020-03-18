class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url, danger: 'please log in.'
      end
    end

end
