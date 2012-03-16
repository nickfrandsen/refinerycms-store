class CartItemsController < ApplicationController
  
  def destroy
    cart = Cart.where(:session_id => session[:session_id]).first
    item = cart.items.where(:id => params[:id]).first
    item.destroy
    redirect_to carts_path
  end

end