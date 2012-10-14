require 'spec_helper'

describe PicturesController do
  describe "#index" do
    it "renders shows a list of pictures" do
      @picture1 = FactoryGirl.create(:picture, name: "Image 1")
      @picture2 = FactoryGirl.create(:picture, name: "Image 2")

      get :index
      response.should render_template :index
      assigns(:pictures).should eq([@picture1, @picture2])
    end
  end
end
