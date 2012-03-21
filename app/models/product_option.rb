class ProductOption < ActiveRecord::Base

  acts_as_indexed :fields => [ :name ]
  attr_accessible :name
  attr_accessible :price

  validates :name, :presence => true

  belongs_to :product 
  
end
