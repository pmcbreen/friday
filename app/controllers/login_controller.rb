class LoginController < ApplicationController

  def login
    session[:member_id] = nil
    if request.get?
      @member = Member.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @member }
      end
    else
      @member = Member.identify(params[:member][:name], params[:member][:password])
      if @member
        session[:member_id] = @member.id
        after_login = session[:after_login] || '/'
        session[:after_login] = nil
        if @member.teacher.present?
          after_login = '/teacher' unless after_login =~ /teacher/
        elsif @member.student.present?
          after_login = '/student' unless after_login =~ /student/
        end
        redirect_to(after_login)
        flash[:notice] = "Welcome #{@member.name} you are now logged in"        
      else
        @member = Member.new
        @member.name = params[:member][:name]
        @member.password = params[:member][:password]
        flash[:notice] = "Login failed"
      end
    end
  end

  def logout
    session[:member_id] = nil
    redirect_to('/')
    flash[:notice] = "Logged Out"
  end
end
