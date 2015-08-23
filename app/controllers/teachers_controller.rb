class TeachersController < ApplicationController
  before_filter :authorize, :except =>  [:index]
  def new
    @teacher = Teacher.new
    @teacher.member = Member.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.build_member(member_params) 
    if @teacher.save && @teacher.member.errors.none?
      redirect_to @teacher
    else
      render 'new'
    end
  end
  
  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.member.nil?
      @teacher.build_member(member_params) 
    end
    if @teacher.update(teacher_params) && @teacher.member.errors.none?
      redirect_to @teacher
    else
      render 'edit'
    end
  end
  
  def show
    @teacher = Teacher.find(params[:id])
  end
  
  def index
    @teachers = Teacher.all
  end
  
  def edit
    @teacher = Teacher.find(params[:id])
  end
  
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    
    redirect_to teachers_path
  end
  
  private
  def teacher_params
    params.require(:teacher).permit(:firstname, :lastname, :title, :aka)
  end
  def member_params
    params.require(:member).permit(:name, :password, :password_confirmation)
  end
  def member_name_param
    params.require(:member).permit(:name)
  end
end
