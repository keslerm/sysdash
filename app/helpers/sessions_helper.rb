module SessionsHelper
  def log_in
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= Users.find_by(:id, session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
