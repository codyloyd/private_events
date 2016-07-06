module SessionsHelper
end

def log_in(user)
  session[:user_id] = user.id
end

def log_out
  session[:user_id] = nil
  @current_user = nil
end

def current_user
  if (user_id = session[:user_id])
    @current_user ||= User.find(user_id)
  end
end

def logged_in?
  !current_user.nil?
end
