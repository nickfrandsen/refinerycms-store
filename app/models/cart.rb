class Cart < ActiveRecord::Base

  acts_as_indexed :fields => [:id]
  
  has_many :items, :class_name => "CartItem", :dependent => :destroy
  
  def add_item(product, price)
    if item = self.items.find_by_product_id(product)
      item.quantity += 1
      item.save
    else
      self.items.create(:product_id => product, :price => price, :quantity => 1)
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
