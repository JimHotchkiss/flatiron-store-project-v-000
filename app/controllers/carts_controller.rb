class CartsController < ApplicationController


  def show
    cart = find_cart
    @user = User.find_by(id: cart[:user_id])
  end

  def checkout
    binding.pry
    cart = find_cart
    @cart_orders = cart.line_items
    # we find the cart and send it over to orders, I think
    # look at rake routes
    redirect_to cart_path

  end

  private

  def find_cart
    cart = Cart.find_by(id: params[:id])
  end

  
end
