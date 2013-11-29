require "spec_helper"

describe CampsController do
  describe "routing" do

    it "routes to #index" do
      get("/camps").should route_to("camps#index")
    end

    it "routes to #new" do
      get("/camps/new").should route_to("camps#new")
    end

    it "routes to #show" do
      get("/camps/1").should route_to("camps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/camps/1/edit").should route_to("camps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/camps").should route_to("camps#create")
    end

    it "routes to #update" do
      put("/camps/1").should route_to("camps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/camps/1").should route_to("camps#destroy", :id => "1")
    end

  end
end
