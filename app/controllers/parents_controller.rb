class ParentsController < ApplicationController
  before_filter :authorize, :except =>  [:index]
  def new
	  @parent = Parent.new
    @parent.member = Member.new
  end
  def index
	  @parents = Parent.all
  end
  def update
	  @parent = Parent.find(params[:id])
    if @parent.member.nil?
      @parent.build_member(member_params) 
    end
    if @parent.update(parent_params) && @parent.member.errors.none?
      redirect_to @parent
    else
      render 'edit'
    end
  end
  def show
	@parent = Parent.find(params[:id])
  end
  def edit
	  @parent = Parent.find(params[:id])
  end
  def create
    @parent = Parent.new(parent_params)
    @parent.build_member(member_params) 
	  if @parent.save && @parent.member.errors.none?
	    redirect_to @parent
	  else
		render 'new'
	  end
	end
  def destroy
	@parent = Parent.find(params[:id])
	@parent.destroy
		
	redirect_to parents_path
  end

private
  def parent_params
    params.require(:parent).permit(:first_name, :last_name)
  end
  def member_params
    params.require(:member).permit(:name, :password, :password_confirmation)
  end
  def member_name_param
    params.require(:member).permit(:name)
  end
end
