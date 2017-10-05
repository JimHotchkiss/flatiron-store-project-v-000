class CartsController < ApplicationController


  def show
    @cart = find_cart
    @user = User.find_by(id: @cart[:user_id])
  end

  def checkout
    @cart = find_cart
    if @cart
      @cart.checkout

      @cart.line_items = []
      redirect_to cart_path
    end

  end


  private

  def find_cart
    cart = Cart.find_by(id: params[:id])
  end


end
