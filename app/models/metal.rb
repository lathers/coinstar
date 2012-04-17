class Metal < ActiveRecord::Base
  require 'open-uri'
  require 'nokogiri'  
  attr_accessible :name
  validates_presence_of :name
  has_many :coins
def price
	current_price = 0
	@doc = Nokogiri::HTML(open("http://finance.yahoo.com/futures?t=metals"))
	@doc.css("#yfitp table tr").each do |tr|
		p = tr.css('.last_trade span').first.content
		metal = tr.css('td.second.name').text		
		if metal.include?'.'
			metal_name, metal_weight, metal_unit, month, day = metal.split(' ')
			metal_name = "#{metal_name} #{metal_weight} #{metal_unit}"
			date = "#{month} #{day}"
		else
			metal_name, month, day = metal.split(' ')
			date = "#{month} #{day}"
		end
		if self.name==metal_name
			current_price=p
		end
	end
	current_price
end


end
