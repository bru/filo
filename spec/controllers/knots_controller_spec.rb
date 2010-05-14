require 'spec_helper'

describe KnotsController do

  def mock_knot(stubs={})
    @mock_knot ||= mock_model(Knot, stubs)
  end

  describe "when signed in" do 
    before(:each) do
      @user = Factory(:email_confirmed_user)
      @controller.current_user = @user
    end
    describe "GET index" do
      it "assigns all knots as @knots" do
        Knot.stub(:find).with(:all).and_return([mock_knot])
        get :index
        assigns[:knots].should == [mock_knot]
      end
    end

    describe "GET show" do
      it "assigns the requested knot as @knot" do
        Knot.stub(:find).with("37").and_return(mock_knot)
        get :show, :id => "37"
        assigns[:knot].should equal(mock_knot)
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
        Knot.stub(:find).with("37").and_return(mock_knot)
        get :edit, :id => "37"
        assigns[:knot].should equal(mock_knot)
      end
    end

    describe "POST create" do

      describe "with valid params" do
        it "assigns a newly created knot as @knot" do
          Knot.stub(:new).with({'these' => 'params'}).and_return(mock_knot(:save => true))
          post :create, :knot => {:these => 'params'}
          assigns[:knot].should equal(mock_knot)
        end

        it "redirects to the created knot" do
          Knot.stub(:new).and_return(mock_knot(:save => true))
          post :create, :knot => {}
          response.should redirect_to(knots_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved knot as @knot" do
          Knot.stub(:new).with({'these' => 'params'}).and_return(mock_knot(:save => false))
          post :create, :knot => {:these => 'params'}
          assigns[:knot].should equal(mock_knot)
        end

        it "re-renders the 'new' template" do
          Knot.stub(:new).and_return(mock_knot(:save => false))
          post :create, :knot => {}
          response.should render_template('new')
        end
      end

    end

    describe "PUT update" do

      describe "with valid params" do
        it "updates the requested knot" do
          Knot.should_receive(:find).with("37").and_return(mock_knot)
          mock_knot.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :knot => {:these => 'params'}
        end

        it "assigns the requested knot as @knot" do
          Knot.stub(:find).and_return(mock_knot(:update_attributes => true))
          put :update, :id => "1"
          assigns[:knot].should equal(mock_knot)
        end

        it "redirects to the knot" do
          Knot.stub(:find).and_return(mock_knot(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(knots_path)
        end
      end

      describe "with invalid params" do
        it "updates the requested knot" do
          Knot.should_receive(:find).with("37").and_return(mock_knot)
          mock_knot.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :knot => {:these => 'params'}
        end

        it "assigns the knot as @knot" do
          Knot.stub(:find).and_return(mock_knot(:update_attributes => false))
          put :update, :id => "1"
          assigns[:knot].should equal(mock_knot)
        end

        it "re-renders the 'edit' template" do
          Knot.stub(:find).and_return(mock_knot(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end
      end

    end

    describe "DELETE destroy" do
      it "destroys the requested knot" do
        Knot.should_receive(:find).with("37").and_return(mock_knot)
        mock_knot.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "redirects to the knots list" do
        Knot.stub(:find).and_return(mock_knot(:destroy => true))
        delete :destroy, :id => "1"
        response.should redirect_to(knots_url)
      end
    end
  end
end
