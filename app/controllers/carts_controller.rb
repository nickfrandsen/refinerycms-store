class CartsController < ApplicationController

  before_filter :find_shopping_cart!

  def index
  end
  
  def create
    product = Product.find(params[:product_id])

    @shopping_cart.add_item(product.id, product.price)
    @shopping_cart.save

    redirect_to carts_path
  end
  
  def update
    cart = Cart.where(:session_id => request.session_options[:id]).first
    item = cart.items.where(:id => params[:id]).first
    item.quantity = params[:cart_item][:quantity]
    item.save
    render :index
  end

end
