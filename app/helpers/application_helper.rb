module ApplicationHelper
  def logged_in?
    return true if @current_user != nil
    return false
  end
end
