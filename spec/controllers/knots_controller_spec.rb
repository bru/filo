require 'spec_helper'

describe KnotsController do

  def mock_knot(stubs={})
    @mock_knot ||= mock_model(Knot, stubs)
  end

  describe "when signed in" do 
    before(:each) do
      @user = Factory(:user)
      @knot = Factory(:knot, :user_id => @user.id)
      sign_in @user
    end
    describe "GET index" do
      it "assigns all knots as @knots" do
        @user.stub(:knots).and_return([@knot])
        get :index
        assigns[:knots].should == [@knot]
      end
    end

    describe "GET show" do
      it "assigns the requested knot as @knot" do
        get :show, :id => @knot.id
        assigns[:knot].should == @knot
      end
    end

    describe "GET new" do
      it "assigns a new knot as @knot" do
        Knot.stub(:new).and_return(mock_knot)
        get :new
        assigns[:knot].should equal(mock_knot)
      end
    end

    describe "GET edit" do
      it "assigns the requested knot as @knot" do
        get :edit, :id => @knot.id
        assigns[:knot].should == @knot
      end
    end

    describe "POST create" do

      describe "with valid params" do
        before :each do 
          Knot.stub(:find_or_initialize_by_url).with("url").and_return(@knot)
          @knot.stub!(:update_attributes).and_return(@knot)
        end
        
        it "assigns a newly created knot as @knot" do
          post :create, :knot => {:url => 'url', :title => 'title', :summary => nil}
          assigns[:knot].should equal(@knot)
        end

        it "redirects to the knot index" do
          post :create, :knot => {:url => 'url', :title => 'title', :summary => nil}
          response.should redirect_to(knots_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved knot as @knot" do
          Knot.stub(:find_or_initialize_by_url).and_return(mock_knot(:user= => true, :save => false, :update_attributes => true))
          post :create, :knot => {:these => 'params'}
          assigns[:knot].should equal(mock_knot)
        end

        it "re-renders the 'new' template" do
          Knot.stub(:new).and_return(mock_knot(:user= => true, :save => false, :update_attributes => true))
          post :create, :knot => {}
          response.should be_redirect
        end
      end

    end

    describe "PUT update" do

      describe "with valid params" do
        it "updates the requested knot" do
          put :update, :id => @knot.id, :knot => {:title => 'new title'}
          assigns[:knot].should == @knot
          assigns[:knot].title.should == 'new title'
        end

        it "assigns the requested knot as @knot" do
          put :update, :id => @knot.id
          assigns[:knot].should == @knot
        end

        it "redirects to the knot" do
          put :update, :id => @knot.id
          response.should redirect_to(knots_path)
        end
      end

      describe "with invalid params" do
        it "assigns the knot as @knot" do
          put :update, :id => @knot.id, :knot => {:these => 'params'}
          assigns[:knot].should == @knot
        end

        it "re-renders the 'edit' template" do
          put :update, :id => @knot.id, :knot => {:these => 'params'}
          response.should render_template('edit')
        end
      end

    end

    describe "DELETE destroy" do
      # it "destroys the requested knot" do
      #   assigns[:knot].should_receive(:destroy)
      #   delete :destroy, :id => @knot.id
      # end

      it "redirects to the knots list" do
        delete :destroy, :id => @knot.id
        response.should redirect_to(knots_url)
      end
    end
  end
end
