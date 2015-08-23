module ApplicationHelper
  def logged_in?
    session[:member_id] && Member.find_by_id(session[:member_id])
  end
  
  def username 
    if logged_in?
      Member.find_by_id(session[:member_id]).name
    end
  end

  def logged_in_as(id)
    id == session[:member_id]
  end
  
  def user_can_edit(id)
    id == session[:member_id] 
  end
  
  def teacher_logged_in?
    if logged_in?
      Member.find(session[:member_id]).teacher.present?
    end
  end
  
  def change_password_path
    logged_in? ? "/password/#{session[:member_id]}" : '/'
  end
end
