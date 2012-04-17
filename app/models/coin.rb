class Coin < ActiveRecord::Base
  attr_accessible :name, :melt_weight, :metal
  
  belongs_to :metal

  validates_presence_of :name
  validates_numericality_of :melt_weight

def price_per
  @pp = @pp || Float(self.metal.price) * self.melt_weight
end

def total_value(count)
  price_per * count
end
  
end
