class KnotsController < ApplicationController
  before_filter :authenticate
  
  # GET /knots
  # GET /knots.xml
  def index
    @knots = Knot.all

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
    @knot = Knot.find(params[:id])
  end

  # POST /knots
  # POST /knots.xml
  def create
    @knot = Knot.new(params[:knot])

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
    @knot = Knot.find(params[:id])

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
    @knot = Knot.find(params[:id])
    @knot.destroy
    flash[:notice] = 'Knot was successfully trashed.'
    respond_to do |format|
      format.html { redirect_to(knots_url) }
      format.xml  { head :ok }
    end
  end
end
