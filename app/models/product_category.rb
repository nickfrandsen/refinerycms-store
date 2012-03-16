class ProductCategory < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  def self.destroy_category(category_id)
    category = ProductCategory.find category_id
    category.destroy if category
    category
  end

  def to_s
    self.name
  end

  def self.options_for_select
    self.order(:sort).collect { |pc| ["#{pc.name}", pc.id] }
  end

end
