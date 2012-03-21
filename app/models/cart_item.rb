class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :product_option
  belongs_to :cart
  
  def subtotal
    quantity * price
  end
  
  def to_s
    return self.product_option.nil? ? self.product.name : "%s (%s)" % [self.product.name, self.product_option.name]
  end
end