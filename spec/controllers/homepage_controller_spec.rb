require 'spec_helper'

describe HomepageController do
  describe "#index" do
    it "renders the home page" do
      get :index
      response.should render_template :index
    end
  end
end
