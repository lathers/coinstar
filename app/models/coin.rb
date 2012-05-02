class Coin < ActiveRecord::Base
  attr_accessible :name, :melt_weight, :metal, :own
  
  belongs_to :metal
  has_many :owned_coins
  has_many :users, :through => :owned_coins  
  validates_presence_of :name
  validates_numericality_of :melt_weight

def owned

end
  
def price_per
  @pp = @pp || Float(self.metal.price) * self.melt_weight
end

def total_value(count)
  price_per * count
end
  
end
