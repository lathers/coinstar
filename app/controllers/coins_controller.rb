class CoinsController < ApplicationController

  def index
    @coins = Coin.find(:all)
    @metals = Metal.find(:all)
  end
	
  def new		
    @coin = Coin.new
    @metals = Metal.find(:all)
  end
	
  def create
    @coin = Coin.new(params[:coin])
    @metal = Metal.find(params[:metal][:id])
    @coin.metal=@metal
    if @coin.save
      redirect_to root_path
    else
      @metals = Metal.find(:all)
      render 'new'
    end

  end
	
  def edit
    @coin = Coin.find(params[:id])
  end
	
  def update		

  end	
	
end
