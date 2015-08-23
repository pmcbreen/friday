class MembersController < ApplicationController
  #before_filter :authorize, :except =>  [:index, :show]
  #before_filter :authorize_edit, :only => [:edit, :update]

  # GET /members
  # GET /members.xml
  def index
    @members = Member.all().select{|m| m.admin? }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end
  def password
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to(members_url, :notice => 'Member was successfully created.') }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    begin  
      @member = Member.find(params[:id])
    rescue ActiveRecord::RecordNotFound
       @link = Member.new(params[:member])
      flash[:notice] = "Record not found, presumed deleted by another user, can recreate it"
      render :action => "new"
      return 
    end
    respond_to do |format|
      if @member.update_attributes(member_params)
        format.html { redirect_to(members_url, :notice => 'Member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    begin
      @member = Member.find(params[:id])
      @member.destroy
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Record not found, presumed deleted by another user"
    end

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def authorize_edit
    unless session[:board_member] ||  params[:id] == session[:member_id].to_s 
      if session[:member_id] 
        flash[:notice] = "Can only edit own record" 
      else
        flash[:notice] = "Login required for this action" 
      end
      redirect_to(:controller => 'members')
    end
  end
  
  private
		def member_params
			params.require(:member).permit(:name, :password, :password_confirmation)
		end

end