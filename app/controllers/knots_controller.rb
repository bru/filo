class KnotsController < ApplicationController
  before_filter :authenticate
  before_filter :find_and_require_owner, :only => [:edit, :update, :destroy]
  
  # GET /knots
  # GET /knots.xml
  def index
    @knots = current_user.knots

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @knots }
    end
  end

  # GET /knots/1
  # GET /knots/1.xml
  def show
    @knot = Knot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @knot }
    end
  end

  # GET /knots/new
  # GET /knots/new.xml
  def new
    @knot = Knot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @knot }
    end
  end

  # GET /knots/1/edit
  def edit
  end

  # POST /knots
  # POST /knots.xml
  def create
    @knot = Knot.new(params[:knot])
    @knot.user = current_user

    respond_to do |format|
      if @knot.save
        flash[:notice] = 'Knot was successfully created.'
        format.html { redirect_to(knots_path) }
        format.xml  { render :xml => @knot, :status => :created, :location => @knot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @knot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knots/1
  # PUT /knots/1.xml
  def update

    respond_to do |format|
      if @knot.update_attributes(params[:knot])
        flash[:notice] = 'Knot was successfully updated.'
        format.html { redirect_to(knots_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @knot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knots/1
  # DELETE /knots/1.xml
  def destroy
    @knot.destroy
    flash[:notice] = 'Knot was successfully trashed.'
    respond_to do |format|
      format.html { redirect_to(knots_url) }
      format.xml  { head :ok }
    end
  end
  
protected
  def find_and_require_owner
    @knot = Knot.find(params[:id])
    deny_access(I18n.t("controllers.knots.require_owner.denied")) unless (@knot && @knot.user == current_user)
  end
end
