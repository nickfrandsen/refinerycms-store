class Cart < ActiveRecord::Base

  acts_as_indexed :fields => [:id]
  
  has_many :items, :class_name => "CartItem", :dependent => :destroy
  
  def add_item(product, option)
    option_id = option.nil? ? nil : option.id

    if !option.nil? and !option.price.blank?
      price = option.price
    else
      price = product.price
    end

    # If option, only find cart item with that particular option and product
    if item = self.items.find_by_product_id_and_product_option_id(product.id, option_id)
      item.quantity += 1
      item.save
    else
      self.items.create(:product_id => product.id, :price => price, :quantity => 1, :product_option_id => option_id)
    end
  end
  
  def subtotal
    unless self.items.empty?
      self.items.map(&:subtotal).reduce(:+)
    else
      return 0
    end
  end
  
end
