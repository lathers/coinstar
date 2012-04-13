require 'spec_helper'

describe Metal do
  it "should require a name" do
    @metal = Metal.new(:name => nil)
    @metal.should_not be_valid
  end

  it "should be valid with valid attributes" do 
    @metal = Metal.new(:name => 'Gold')
    @metal.should be_valid
  end

end
