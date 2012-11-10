require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ClippingsController do

  # This should return the minimal set of attributes required to create a valid
  # Clipping. As you add validations to Clipping, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all clippings as @clippings" do
      clipping = Clipping.create! valid_attributes
      get :index
      assigns(:clippings).should eq([clipping])
    end
  end

  describe "GET show" do
    it "assigns the requested clipping as @clipping" do
      clipping = Clipping.create! valid_attributes
      get :show, :id => clipping.id.to_s
      assigns(:clipping).should eq(clipping)
    end
  end

  describe "GET new" do
    it "assigns a new clipping as @clipping" do
      get :new
      assigns(:clipping).should be_a_new(Clipping)
    end
  end

  describe "GET edit" do
    it "assigns the requested clipping as @clipping" do
      clipping = Clipping.create! valid_attributes
      get :edit, :id => clipping.id.to_s
      assigns(:clipping).should eq(clipping)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Clipping" do
        expect {
          post :create, :clipping => valid_attributes
        }.to change(Clipping, :count).by(1)
      end

      it "assigns a newly created clipping as @clipping" do
        post :create, :clipping => valid_attributes
        assigns(:clipping).should be_a(Clipping)
        assigns(:clipping).should be_persisted
      end

      it "redirects to the created clipping" do
        post :create, :clipping => valid_attributes
        response.should redirect_to(Clipping.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved clipping as @clipping" do
        # Trigger the behavior that occurs when invalid params are submitted
        Clipping.any_instance.stub(:save).and_return(false)
        post :create, :clipping => {}
        assigns(:clipping).should be_a_new(Clipping)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Clipping.any_instance.stub(:save).and_return(false)
        post :create, :clipping => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested clipping" do
        clipping = Clipping.create! valid_attributes
        # Assuming there are no other clippings in the database, this
        # specifies that the Clipping created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Clipping.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => clipping.id, :clipping => {'these' => 'params'}
      end

      it "assigns the requested clipping as @clipping" do
        clipping = Clipping.create! valid_attributes
        put :update, :id => clipping.id, :clipping => valid_attributes
        assigns(:clipping).should eq(clipping)
      end

      it "redirects to the clipping" do
        clipping = Clipping.create! valid_attributes
        put :update, :id => clipping.id, :clipping => valid_attributes
        response.should redirect_to(clipping)
      end
    end

    describe "with invalid params" do
      it "assigns the clipping as @clipping" do
        clipping = Clipping.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Clipping.any_instance.stub(:save).and_return(false)
        put :update, :id => clipping.id.to_s, :clipping => {}
        assigns(:clipping).should eq(clipping)
      end

      it "re-renders the 'edit' template" do
        clipping = Clipping.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Clipping.any_instance.stub(:save).and_return(false)
        put :update, :id => clipping.id.to_s, :clipping => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested clipping" do
      clipping = Clipping.create! valid_attributes
      expect {
        delete :destroy, :id => clipping.id.to_s
      }.to change(Clipping, :count).by(-1)
    end

    it "redirects to the clippings list" do
      clipping = Clipping.create! valid_attributes
      delete :destroy, :id => clipping.id.to_s
      response.should redirect_to(clippings_url)
    end
  end

end
