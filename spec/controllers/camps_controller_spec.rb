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

describe CampsController do

  # This should return the minimal set of attributes required to create a valid
  # Camp. As you add validations to Camp, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "student_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CampsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all camps as @camps" do
      camp = Camp.create! valid_attributes
      get :index, {}, valid_session
      assigns(:camps).should eq([camp])
    end
  end

  describe "GET show" do
    it "assigns the requested camp as @camp" do
      camp = Camp.create! valid_attributes
      get :show, {:id => camp.to_param}, valid_session
      assigns(:camp).should eq(camp)
    end
  end

  describe "GET new" do
    it "assigns a new camp as @camp" do
      get :new, {}, valid_session
      assigns(:camp).should be_a_new(Camp)
    end
  end

  describe "GET edit" do
    it "assigns the requested camp as @camp" do
      camp = Camp.create! valid_attributes
      get :edit, {:id => camp.to_param}, valid_session
      assigns(:camp).should eq(camp)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Camp" do
        expect {
          post :create, {:camp => valid_attributes}, valid_session
        }.to change(Camp, :count).by(1)
      end

      it "assigns a newly created camp as @camp" do
        post :create, {:camp => valid_attributes}, valid_session
        assigns(:camp).should be_a(Camp)
        assigns(:camp).should be_persisted
      end

      it "redirects to the created camp" do
        post :create, {:camp => valid_attributes}, valid_session
        response.should redirect_to(Camp.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved camp as @camp" do
        # Trigger the behavior that occurs when invalid params are submitted
        Camp.any_instance.stub(:save).and_return(false)
        post :create, {:camp => { "student_id" => "invalid value" }}, valid_session
        assigns(:camp).should be_a_new(Camp)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Camp.any_instance.stub(:save).and_return(false)
        post :create, {:camp => { "student_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested camp" do
        camp = Camp.create! valid_attributes
        # Assuming there are no other camps in the database, this
        # specifies that the Camp created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Camp.any_instance.should_receive(:update_attributes).with({ "student_id" => "1" })
        put :update, {:id => camp.to_param, :camp => { "student_id" => "1" }}, valid_session
      end

      it "assigns the requested camp as @camp" do
        camp = Camp.create! valid_attributes
        put :update, {:id => camp.to_param, :camp => valid_attributes}, valid_session
        assigns(:camp).should eq(camp)
      end

      it "redirects to the camp" do
        camp = Camp.create! valid_attributes
        put :update, {:id => camp.to_param, :camp => valid_attributes}, valid_session
        response.should redirect_to(camp)
      end
    end

    describe "with invalid params" do
      it "assigns the camp as @camp" do
        camp = Camp.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Camp.any_instance.stub(:save).and_return(false)
        put :update, {:id => camp.to_param, :camp => { "student_id" => "invalid value" }}, valid_session
        assigns(:camp).should eq(camp)
      end

      it "re-renders the 'edit' template" do
        camp = Camp.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Camp.any_instance.stub(:save).and_return(false)
        put :update, {:id => camp.to_param, :camp => { "student_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested camp" do
      camp = Camp.create! valid_attributes
      expect {
        delete :destroy, {:id => camp.to_param}, valid_session
      }.to change(Camp, :count).by(-1)
    end

    it "redirects to the camps list" do
      camp = Camp.create! valid_attributes
      delete :destroy, {:id => camp.to_param}, valid_session
      response.should redirect_to(camps_url)
    end
  end

end
