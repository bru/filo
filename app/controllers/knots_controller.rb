class KnotsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_and_require_owner, :except => [:index, :new, :show, :create, :pop]
  
  # GET /knots
  # GET /knots.xml
  def index
    @knots  = current_user.knots
    respond_to do |format|
      format.html do
        @unread = @knots.unread.paginate :page => params[:page], :per_page => 10
        @read   = @knots.read[0..9]
      end
      format.xml  { render :xml => @knots   }
      format.rss  { render :layout => false }
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
      format.html { render :layout => (params[:remote] ? false : true)}
      format.xml  { render :xml => @knot }
    end
  end

  # GET /knots/1/edit
  def edit
  end

  # POST /knots
  # POST /knots.xml
  def create
    knot_params = normalize_knot_params(params)
    @knot = current_user.knots.find_or_initialize_by_url(knot_params[:url])

    respond_to do |format|
      begin
        if @knot.update_attributes(knot_params)
          flash[:notice] = I18n.t('controllers.knots.create.success')
          format.html do
            if params[:remote]
              render :layout => "bookmarklet"
            else
              redirect_to knots_path
            end
          end
          format.iphone { redirect_to iphone_path }
          format.xml  { render :xml => @knot, :status => :created, :location => @knot }
        else
          raise ActiveRecord::AttributeAssignmentError 
        end
      rescue Exception => e
        flash[:alert] = I18n.t('controllers.knots.create.failure')
        format.html { redirect_to new_knot_path }
        format.xml  { render :xml => @knot.errors, :status => :unprocessable_entity }
      end     
    end
  end

  # PUT /knots/1
  # PUT /knots/1.xml
  def update
    respond_to do |format|
      begin
        if @knot.update_attributes(params[:knot])
          flash[:notice] = I18n.t('controllers.knots.update.success')
          format.html { redirect_to(knots_path) }
          format.xml  { head :ok }
        else
          raise ActiveRecord::AttributeAssignmentError 
        end
      rescue Exception => e          
        format.html { render :action => "edit" }
        format.xml  { render :xml => @knot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knots/1
  # DELETE /knots/1.xml
  def destroy
    @knot.destroy
    flash[:notice] = I18n.t('controllers.knots.destroy.success')
    respond_to do |format|
      format.html { redirect_to(knots_url) }
      format.xml  { head :ok }
    end
  end
  
  # Custom workflow actions
  
  # GET /knots/1/skip
  def skip
    @knot.read!
    flash[:notice] = I18n.t('controllers.knots.skip.success')
    respond_to do |format|
      format.html { redirect_to(knots_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /knots/1/replay
  def replay
    @knot.unread!
    flash[:notice] = I18n.t('controllers.knots.replay.success')
    respond_to do |format|
      format.html { redirect_to(knots_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /knots/1/trash
  def trash
    @knot.trash!
    flash[:notice] = I18n.t('controllers.knots.trash.success')
    respond_to do |format|
      format.html { redirect_to(knots_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /knots/1/read
  def read
    @knot.read!
    redirect_to @knot.url
  end
  
  def pop
    @knot = current_user.knots.unread.last
    redirect_to read_knot_path(@knot)
  end
    
  
protected
  def normalize_knot_params(params={})
    if params[:remote]
      params[:knot] = { 
          :url      => params[:u],
          :title    => params[:t],
          :summary  => params[:s]
      }
    end
    params[:knot][:url].downcase! if params[:knot][:url].present?
    return params[:knot]
  end
  
  def find_and_require_owner
    @knot = current_user.knots.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    deny_action( I18n.t("controllers.knots.require_owner.denied") )
  end
  
end
