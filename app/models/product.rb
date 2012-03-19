class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :description]
  alias_attribute :title, :name

  has_friendly_id :name, :use_slug => true

  has_many_page_images

  has_many :product_options, :dependent => :destroy 
  accepts_nested_attributes_for :product_options, :allow_destroy => true

  validates :name, :presence => true, :uniqueness => true
  validates :product_category_id, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true

  belongs_to :product_category
  
  has_many :cart_items, :dependent => :destroy
  
  # after_save :expire_cached
  before_destroy :ensure_not_referenced_by_any_cart_item

  delegate :name, :to => :slug, :prefix => true, :allow_nil => true
  
  def ensure_not_referenced_by_any_cart_item
    if cart_items.count.zero?
      return true
    else
      errors[:base] << "Cart Items present"
      return false
    end
  end

end
