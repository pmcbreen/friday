class StudentsController < ApplicationController
  before_filter :authorize, :except =>  [:index]
  def new
    @student = Student.new
    @student.member = Member.new
  end
  
  def create
    @student = Student.new(student_params)
    @student.build_member(member_params) 
    if @student.save && @student.member.errors.none?
      redirect_to @student
    else
      render 'new'
    end
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.member.nil?
      @student.build_member(member_params) 
    end
    if @student.update(student_params) && @student.member.errors.none?
      redirect_to @student
    else
      render 'edit'
    end
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def index
    @students = Student.all
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    
    redirect_to students_path
  end
  
  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :title, :aka)
  end
  def member_params
    params.require(:member).permit(:name, :password, :password_confirmation)
  end
  def member_name_param
    params.require(:member).permit(:name)
  end
end
