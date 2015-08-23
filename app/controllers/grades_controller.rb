class GradesController < ApplicationController
  before_filter :authorize, :except =>  [:index]
	def index
		@grades = Grade.all
	end
	
	def show
		@grade = Grade.find(params[:id])
	end

	def new
		@grade = Grade.new
	end
	
	def edit
		@grade = Grade.find(params[:id])
	end
	
	def create
		@grade = Grade.new(grade_params)
		
		if @grade.save
			redirect_to @grade
		else
			render 'new' 
		end
	end
	
	def update
		@grade = Grade.find(params[:id])
		
		if @grade.update(grade_params)
			redirect_to @grade
		else
			render 'edit'
		end
	end
	
	def destroy
		@grade = Grade.find(params[:id])
		@grade.destroy
		redirect_to grades_path
	end


	
	private
		def grade_params
			params.require(:grade).permit(:grade_level)
		end

end
