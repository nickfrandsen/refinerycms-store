class ProductCategory < ActiveRecord::Base

  acts_as_indexed :fields => [:name]
  validates :name, :presence => true, :uniqueness => true
  alias_attribute :title, :name

  has_friendly_id :name, :use_slug => true
  has_many :products

  def to_s
    self.name
  end

  def self.options_for_select
    self.order(:sort).collect { |pc| ["#{pc.name}", pc.id] }
  end

  def self.with_products
    self.joins(:products).select('distinct product_categories.*')
  end

  before_destroy :ensure_not_referenced_by_any_product

  def ensure_not_referenced_by_any_product
    if products.count.zero?
      return true
    else
      errors[:base] << "This category is in use"
      return false
    end
  end

end
