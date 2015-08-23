class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected
  
  def logged_in?
    session[:member_id] && Member.find_by_id(session[:member_id])
  end
  
  def authorize
    unless logged_in?
      flash[:notice] = "Login required for this action"
      session[:after_login] = request.parameters
      redirect_to(:controller => 'login', :action => 'login')
    end
  end
  def logged_in_teacher
    Member.find_by_id(session[:member_id]).teacher if logged_in?
  end
  def teacher_logged_in?
    unless logged_in? && Member.find_by_id(session[:member_id]).teacher
      flash[:notice] = "Must be logged in as Teacher"
      session[:after_login] = request.parameters
      redirect_to(:controller => 'login', :action => 'login')
    end
  end
  
end
