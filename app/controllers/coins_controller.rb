class CoinsController < ApplicationController

  def index
    @coins = Coin.find(:all)
    @metals = Metal.find(:all)
  end
	
  def new		
    @coin = Coin.new
  end
	
  def create
    @coin = Coin.new(params[:coin])
    if @coin.save
      redirect_to 'index'
    else
      render :partial => 'new'
    end

  end
	
  def edit
    @coin = Coin.find(params[:id])
  end
	
  def update		

  end	
	
end
