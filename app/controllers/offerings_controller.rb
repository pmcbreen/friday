class OfferingsController < ApplicationController
  before_filter :authorize, :except =>  [:index]
  before_filter :teacher_logged_in?, :except => []
  def index
    @offerings = Offering.all
  end
  
  def show
    @offering = Offering.find(params[:id])
  end
  
  def new
    @offering = Offering.new
    @offering.long_desc = "Bold text requires **a double asterisk** on each side, _italics a single underscore_ and even links are simple like [this link](http://renert.com/)."
  end
  
  def edit
    @offering = Offering.find(params[:id])
  end
  
  def create
    @offering = Offering.new(offering_params)
    @offering.teacher_ids = params[:offering][:teacher_ids]
    @offering.division_ids = params[:offering][:division_ids]
    @offering.grade_ids = (params[:offering][:grade_ids]).reject!{|gid| 
      "".eql?(gid) ? true : @offering.division_ids.include?(Grade.find(gid).division_id) } 
    
    if @offering.save
      redirect_to @offering
    else
      render 'new'
    end
  end
  
  def update
    @offering = Offering.find(params[:id])
    @offering.teacher_ids = params[:offering][:teacher_ids]
    @offering.division_ids = params[:offering][:division_ids]
    @offering.grade_ids = (params[:offering][:grade_ids]).reject!{|gid| 
      "".eql?(gid) ? true : @offering.division_ids.include?(Grade.find(gid).division_id) }
          
    if @offering.update(offering_params)
      redirect_to @offering
    else
      render 'edit'
    end
  end
  
  def destroy
    @offering = Offering.find(params[:id])
    @offering.destroy
    
    redirect_to offerings_path
  end
  
  private
  def offering_params
    params.require(:offering).permit(:title, :short_desc, :long_desc, :div_num)
  end
end
