class Coin < ActiveRecord::Base
  attr_accessible :name, :melt_weight
  
  validates_presence_of :name
  validates_numericality_of :melt_weight

end
