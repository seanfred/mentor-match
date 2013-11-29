require "spec_helper"

describe MentorshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/mentorships").should route_to("mentorships#index")
    end

    it "routes to #new" do
      get("/mentorships/new").should route_to("mentorships#new")
    end

    it "routes to #show" do
      get("/mentorships/1").should route_to("mentorships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mentorships/1/edit").should route_to("mentorships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mentorships").should route_to("mentorships#create")
    end

    it "routes to #update" do
      put("/mentorships/1").should route_to("mentorships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mentorships/1").should route_to("mentorships#destroy", :id => "1")
    end

  end
end
