require 'spec_helper'

describe FontsController do
  describe "#index" do
    it "renders shows a list of fonts" do
      @font1 = FactoryGirl.create(:font, name: "Blueberry Normal")
      @font2 = FactoryGirl.create(:font, name: "Jenkins Bold")

      get :index
      response.should render_template :index
      assigns(:fonts).should eq([@font1, @font2])
    end
  end
end
