class CartsController < ApplicationController

  before_filter :get_cart

  def index
    present @page
  end
  
  def create
    product = Product.find(params[:product_id])

    @cart.add_item(product.id, product.price)
    @cart.save

    redirect_to carts_path
  end
  
  def update
    item = CartItem.find(params[:id])
    unless item.nil?
      item.quantity = params[:cart_item][:quantity]
      item.save
    end
    redirect_to carts_path
  end

private

  def get_cart
    @cart = Cart.find_or_create_by_session_id(request.session_options[:id])
  end
  
end
