class ProductOption < ActiveRecord::Base

  acts_as_indexed :fields => [ :option_name ]
  attr_accessible :option_name
  attr_accessible :price_override

  validates :option_name, :presence => true

  belongs_to :product 
  
end
