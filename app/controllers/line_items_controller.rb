class LineItemsController < ApplicationController


  def create
    @cart = Cart.find_by(id: current_user.current_cart_id)
    @cart.add_item(params[:item_id])
    @cart.save
    redirect_to cart_path(@cart)

  end

end
