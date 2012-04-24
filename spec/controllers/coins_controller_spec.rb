require 'spec_helper'

describe CoinsController do
  render_views

  before(:each) do
    @valid_attributes = {
     :name => "Some Coin",
     :melt_weight => 0.1,
     :metal => {:id => 1},
    }
  end 
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

  describe 'create' do 
    it "should redirect to index" do
      post :create, :coin => @valid_attributes
      response.code.should == "302"
      response.should redirect_to "/coins"
    end

    it "should show new if there are validation errors" do
      post :create, :coin => @valid_attributes.merge(:name => nil)
      response.code.should ="200"
      response.should render_template("new")
    end
  end
end
