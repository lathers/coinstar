# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'date'
require 'open-uri'
require 'nokogiri'
require 'pry'

@doc = Nokogiri::HTML(open("http://finance.yahoo.com/futures?t=metals"))
@doc.css("#yfitp table tr").each do |tr|
	price = tr.css('.last_trade span').first.content
	metal = tr.css('td.second.name').text		
	if metal.include?'.'
		metal_name, metal_weight, metal_unit, month, day = metal.split(' ')
		metal_name = "#{metal_name} #{metal_weight} #{metal_unit}"
		date = "#{month} #{day}"
	else
		metal_name, month, day = metal.split(' ')
		date = "#{month} #{day}"
	end
	Metal.create(:name => metal_name)
end 

puts "CREATING COINS"

#metals = Metal.create([{name: 'Copper'}, {name: 'Gold 100oz'}, {name: 'Gold'}, {name: 'Palladium'}, {name: 'Platinum'}, {name: 'Silver 5000oz'}, {name: 'Silver'}])
