module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

 def current_user
   # Returns the current logged-in user (if any).
   @current_user ||= User.find_by(id: session[:user_id])
   #  same as @current_user = @current_user || User.find_by(id: session[:user_id])
 end

 def logged_in?
   # Returns true if the user is logged in, false otherwise.
   !current_user.nil?
 end

 def log_out
   session.delete(:user_id)
   @current_user = nil
 end
end
