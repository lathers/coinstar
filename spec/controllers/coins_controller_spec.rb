require 'spec_helper'

describe CoinsController do
  render_views
  describe "index" do
    it "should show list of coins" do
      get :index
      response.code.should == "200"
      response.body.should have_selector("#coins")
    end
  end

  describe 'new' do
    it "should show new form" do
      get :new
      response.code.should == "200"
      response.body.should have_selector("#new_coin")      
    end
  end
end
