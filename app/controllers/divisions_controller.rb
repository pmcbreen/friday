class DivisionsController < ApplicationController
  before_filter :authorize, :except =>  [:index]
	def index
		@divisions = Division.all		
	end
	
	def show
		@division = Division.find(params[:id])
	end

	def new
		@division = Division.new
	end

	def edit
		@division = Division.find(params[:id])
	end
	
	def create
		@division = Division.new(division_params)
        @division.grade_ids = params[:division][:grade_ids]
		
		if @division.save
			redirect_to @division
		else
			render 'new'
		end

	end

	def update
		@division = Division.find(params[:id])
        @division.grade_ids = params[:division][:grade_ids]
        
        if @division.update(division_params)
            redirect_to @division
        else
            render 'edit'
        end
    end

  def destroy
    @division = Division.find(params[:id])
    @division.destroy
 
    redirect_to divisions_path
  end
private
	def division_params
		params.require(:division).permit(:div_number)
	end
end
