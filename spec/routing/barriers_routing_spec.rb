require "spec_helper"

describe BarriersController do
  describe "routing" do

    it "routes to #index" do
      get("/barriers").should route_to("barriers#index")
    end

    it "routes to #new" do
      get("/barriers/new").should route_to("barriers#new")
    end

    it "routes to #show" do
      get("/barriers/1").should route_to("barriers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/barriers/1/edit").should route_to("barriers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/barriers").should route_to("barriers#create")
    end

    it "routes to #update" do
      put("/barriers/1").should route_to("barriers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/barriers/1").should route_to("barriers#destroy", :id => "1")
    end

  end
end
