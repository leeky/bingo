require 'spec_helper'

describe "routing to the home page" do
  it "routes / to Homepage#index" do
    get("/").should route_to("homepage#index")
  end
end