require "spec_helper"

describe ClippingsController do
  describe "routing" do

    it "routes to #index" do
      get("/clippings").should route_to("clippings#index")
    end

    it "routes to #new" do
      get("/clippings/new").should route_to("clippings#new")
    end

    it "routes to #show" do
      get("/clippings/1").should route_to("clippings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clippings/1/edit").should route_to("clippings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clippings").should route_to("clippings#create")
    end

    it "routes to #update" do
      put("/clippings/1").should route_to("clippings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clippings/1").should route_to("clippings#destroy", :id => "1")
    end

  end
end
