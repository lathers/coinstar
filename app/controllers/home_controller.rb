class HomeController < ApplicationController

def index  
  @coins = Coin.find(:all)
end

end
