class OwnedCoin < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :coin
end
