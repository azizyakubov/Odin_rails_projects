class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # Sessions helper module was generated automatically when generating the Sessions
  # controller (Section 8.1.1). Moreover, such helpers are automatically included
  # in Rails views; by including the module into the base class of all controllers
  # (the Application controller), we arrange to make them available in our controllers as well
  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
