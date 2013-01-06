require 'spec_helper'

describe "routing to the home page" do
  it "routes / to Homepage#index" do
    get("/").should route_to("card_sets#index")
  end

  it "routes /fonts to Fonts#index" do
    get("/fonts").should route_to("fonts#index")
  end
end
