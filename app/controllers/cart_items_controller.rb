class CartItemsController < ApplicationController
  
  def destroy
    CartItem.delete(params[:id])
    redirect_to carts_path
  end

end