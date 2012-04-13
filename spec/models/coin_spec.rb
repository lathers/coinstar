require 'spec_helper'

describe Coin do
  before(:each) do
    @attr = {:name => 'Some Coin', :melt_weight => 0.12 }
  end  

  it "should be valid" do
      coin = Coin.new(@attr)
      coin.should be_valid
  end

  it "should require a name" do
    coin = Coin.new(:melt_weight => 0.12)
    coin.should_not be_valid
  end

  it "should require a melt weight" do
    coin = Coin.new(:name => 'Some Coin')
    coin.should_not be_valid
  end

end
